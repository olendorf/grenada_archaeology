CarrierWave.configure do |config|
  # config.storage = :fog
  # config.storage = :file if Rails.env.test?
  config.enable_processing = false if Rails.env.test?
  config.fog_provider = 'fog/aws' unless Rails.env.test? # required
  config.fog_credentials = {
    provider:              'AWS',                        # required
    aws_access_key_id:     ENV['S3_KEY'],                        # required
    aws_secret_access_key: ENV['S3_SECRET'],                        # required
    region:                ENV['S3_REGION'],                  # optional, defaults to 'us-east-1'
  #   host:                  's3.example.com',             # optional, defaults to nil
  #   endpoint:              'https://s3.example.com:8080' # optional, defaults to nil
  }
  config.fog_directory  = ENV['S3_BUCKET']                                  # required
  config.fog_public     = false                                                 # optional, defaults to true
  config.fog_attributes = { cache_control: "public, max-age=#{365.days.to_i}" } # optional, defaults to {}
end