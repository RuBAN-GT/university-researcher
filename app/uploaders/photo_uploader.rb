class PhotoUploader < CarrierWave::Uploader::Base
  include CarrierWave::RMagick

  storage :file

  process :resize_to_limit => [1280, 1280]
  process :convert => 'jpg'

  version :thumb do
    process :resize_to_fit => [300, 300]
  end

  def filename
    "#{random_filename}.#{file.extension}" if original_filename.present?
  end

  def store_dir
    "uploads/#{model.class.to_s.underscore}"
  end

  def extension_whitelist
    %w(jpg jpeg bmp png)
  end

  protected

    def random_filename
      var = :"@#{mounted_as}_secure_token"

      model.instance_variable_get(var) || model.instance_variable_set(var, SecureRandom.uuid)
    end
end
