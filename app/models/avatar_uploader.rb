class AvatarUploader < CarrierWave::Uploader::Base
    storage :file

    def extension_whitelist
        %w(jpg jpeg gif png)
    end

    def store_dir
        'public/images'
    end
end