require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'

if Rails.env.production?
    CarrierWave.configure do |config|
        config.cache_dir = "#{Rails.root}/tmp/uploads"
        config.fog_provider = 'fog/aws'
        config.fog_credentials = {
      
          provider: 'AWS',
          region:  ENV['S3_REGION'],
          aws_access_key_id: ENV['S3_ACCESS_KEY_ID'],
          aws_secret_access_key: ENV['S3_SECRET_ACCESS_KEY'],
      
        }
        config.fog_directory  = ENV['S3_BUCKET']
    end
  # 日本語ファイル名の設定
  CarrierWave::SanitizedFile.sanitize_regexp = /[^[:word:]\.\-\+]/ 
end