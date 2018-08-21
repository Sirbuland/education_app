require 'fog-aws'
CarrierWave.configure do |config|

   # For testing, upload files to local tmp folder.
   if Rails.env.test? || Rails.env.development?
      config.storage = :file
      config.root = Rails.root
   elsif Rails.env.production?
      config.root =  Rails.root
      config.storage    = :fog
   elsif Rails.env.staging?
      config.root = Rails.root
      config.storage = :file
   end

   config.fog_credentials = {
      :provider               => 'AWS',                        # required
      :aws_access_key_id      => ENV['S3_ACCESS_KEY_ID'],      # required
      :aws_secret_access_key  => ENV['S3_SECRET_ACCESS_KEY'],  # required
      :region                 => ENV['S3_REGION']              # required
   }

   config.fog_directory  =  ENV['S3_BUCKET']                        # required
   config.fog_public     = true
   config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}   # optional, defaults to {}
end