Terraspace::Layering.module_eval do
  def pre_layers
    [
      "#{ENV['CLIENTE']}/#{ENV['AWS_REGION']}/#{ENV['TS_ENV']}"
    ]
  end
end