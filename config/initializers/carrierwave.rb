CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',                        # required
    :aws_access_key_id      => 'AKIAJNQK5VG4WTXMNUBQ',                        # required
    :aws_secret_access_key  => '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',                        # required
    :region                 => 'eu-west-1',                  # optional, defaults to 'us-east-1'
  }
  config.fog_directory  = 'filmwerkplaats'                     # required
  config.fog_public     = false                                   # optional, defaults to true
  config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}  # optional, defaults to {}
end