# ###############################################################################
# VPC Module
# ###############################################################################

module "vpc" {
  source = "terraform-aws-modules/vpc/aws"
  version = "3.14.0"
  name = "${var.project_name}-vpc"
  cidr = var.cidr
  azs             = var.azs
  private_subnets = var.private_subnets
  public_subnets  = var.public_subnets
  redshift_subnets = var.redshift_subnets
  database_subnets = var.database_subnets
  enable_nat_gateway = true
  single_nat_gateway = true

  public_subnet_tags = {
    Name = "${var.project_name}-public"
  }

  tags = var.tags
}

################################################################################
# S3 Module
################################################################################
module "s3_bucket" {
  source = "terraform-aws-modules/s3-bucket/aws"
  version = "3.2.0"
  bucket = "${var.project_name}-<%= expansion(':ENV-:ACCOUNT-:REGION') %>"

  tags = var.tags

  # S3 bucket-level Public Access Block configuration
  block_public_acls       = var.block_public_acls
  block_public_policy     = var.block_public_policy
  ignore_public_acls      = var.ignore_public_acls
  restrict_public_buckets = var.restrict_public_buckets
  create_bucket = var.create_bucket
}

################################################################################
# EKS Module
################################################################################
module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "18.20.0" //var.tf_version adicionar versões em variáveis//

  cluster_name    = "${var.project_name}-<%= expansion(':ENV') %>"
  cluster_version = var.cluster_version

  cluster_endpoint_private_access = var.cluster_endpoint_private_access
  cluster_endpoint_public_access  = var.cluster_endpoint_public_access

  cluster_addons = { 
    kube-proxy = {}
    vpc-cni = {
      resolve_conflicts = "OVERWRITE"
    }
  }

  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets

  # Extend cluster security group rules
  cluster_security_group_additional_rules = {
    egress_nodes_ephemeral_ports_tcp = {
      description                = "To node 1025-65535"
      protocol                   = "tcp"
      from_port                  = 1025
      to_port                    = 65535
      type                       = "egress"
      source_node_security_group = true
    }
  }

  # Extend node-to-node security group rules
  node_security_group_additional_rules = {
    ingress_self_all = {
      description = "Node to node all ports/protocols"
      protocol    = "-1"
      from_port   = 0
      to_port     = 0
      type        = "ingress"
      self        = true
    }
    egress_all = {
      description      = "Node all egress"
      protocol         = "-1"
      from_port        = 0
      to_port          = 0
      type             = "egress"
      cidr_blocks      = ["0.0.0.0/0"]
    }
  }

  # EKS Managed Node Group(s)
  eks_managed_node_groups = {
    (var.project_name) = {
      min_size     = var.min_size
      max_size     = var.max_size
      desired_size = var.desired_capacity

      instance_types = var.instance_type
      capacity_type  = var.capacity_type
      attach_cluster_primary_security_group = false
      vpc_security_group_ids                = [aws_security_group.additional.id]
    }
  }

  # Fargate Profile(s)
  fargate_profiles = {
    default = {
      name = "fargate"
      selectors = [
        {
          namespace = "fargate"
        }
      ]
    }
  }

  tags = var.tags
}

resource "aws_security_group" "additional" {
  name_prefix = "${var.project_name}-sg-additional"
  vpc_id      = module.vpc.vpc_id

  ingress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"
    cidr_blocks = [
      "172.31.0.0/16"
    ]
  }

  egress {
    protocol         = "-1"
    from_port        = 0
    to_port          = 0
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = var.tags
}

################################################################################
# EKS Resources
################################################################################

provider "kubernetes" {
  host                   = module.eks.cluster_endpoint
  cluster_ca_certificate = base64decode(module.eks.cluster_certificate_authority_data)

  exec {
    api_version = "client.authentication.k8s.io/v1beta1"
    command     = "aws"
    # This requires the awscli to be installed locally where Terraform is executed
    args = ["eks", "get-token", "--cluster-name", module.eks.cluster_id]
  }
}

provider "helm" {
  kubernetes {
    host                   = module.eks.cluster_endpoint
    cluster_ca_certificate = base64decode(module.eks.cluster_certificate_authority_data)

    exec {
      api_version = "client.authentication.k8s.io/v1beta1"
      command     = "aws"
      # This requires the awscli to be installed locally where Terraform is executed
      args = ["eks", "get-token", "--cluster-name", module.eks.cluster_id]
    }
  }
}

module "eks_auth" {
  source  = "aidanmelen/eks-auth/aws"
  version = "1.0.0"
  eks    = module.eks
  map_roles = var.aws_auth_roles
  map_users = var.aws_auth_users
  map_accounts = var.aws_auth_accounts
  depends_on = [
    module.eks
  ]
}

module "cluster_autoscaler" {
  source  = "../eks-cluster-autoscaler"

  enabled = true
  cluster_name                     = module.eks.cluster_id
  cluster_identity_oidc_issuer     = module.eks.cluster_oidc_issuer_url
  cluster_identity_oidc_issuer_arn = module.eks.oidc_provider_arn
  aws_region                       = "<%= expansion(':REGION') %>"

  depends_on = [
    module.eks
  ]
}

module "eks-grafana-prometheus" {
  source  = "../eks-grafana-prometheus"

  enabled = var.enable_grafana_prometheus

  depends_on = [
    module.eks
  ]
}