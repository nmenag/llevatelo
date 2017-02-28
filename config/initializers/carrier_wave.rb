CarrierWave.configure do |config|
  config.fog_provider = 'fog/aws'
  config.root = Rails.root.join('tmp')
  config.cache_dir = 'carrierwave'
                      # required
  config.fog_credentials = {
    :provider              => 'AWS',
    :aws_access_key_id     => ENV['S3_KEY'],
    :aws_secret_access_key => ENV['S3_SECRET'],
    :region                => ENV['S3_REGION']
    # host:                  's3.example.com',             # optional, defaults to nil
    # endpoint:              'nmenag-quincename.s3-website-us-west-2.amazonaws.com' # optional, defaults to nil
  }

  config.fog_directory  = 'llevatelo'                          # required
  config.fog_public     = false                                        # optional, defaults to true
  config.fog_attributes = { 'Cache-Control' => "max-age=#{365.day.to_i}" } # optional, defaults to {}
end
