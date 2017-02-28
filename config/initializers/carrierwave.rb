CarrierWave.configure do |config|
  config.fog_provider = 'fog/aws'                        # required
  config.fog_credentials = {
    provider:              'AWS',                        # required
    aws_access_key_id:     ENV['S3_KEY'],                        # required
    aws_secret_access_key: ENV['S3_SECRET'],                        # required
    region:                ENV['S3_REGION']                # optional, defaults to 'us-east-1'
    # host:                  's3.example.com',             # optional, defaults to nil
    # endpoint:              'nmenag-quincename.s3-website-us-west-2.amazonaws.com' # optional, defaults to nil
  }

  config.fog_directory  = 'llevatelo'                          # required
  config.fog_public     = false                                        # optional, defaults to true
  config.fog_attributes = { 'Cache-Control' => "max-age=#{365.day.to_i}" } # optional, defaults to {}
end
