class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  storage :fog

  def store_dir
    "#{model.class.table_name}/#{model.id}/#{mounted_as}"
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end

  def filename
    "original.#{file.extension}" if original_filename
  end

  version :medium do
    process resize_to_fill: [400,400]

    def full_filename(for_file = model.logo.file)
      "medium.#{for_file.split(".").last}"
    end
  end

  version :thumbnail do
    process resize_to_fill: [200,200]

    def full_filename(for_file = model.logo.file)
      "thumbnail.#{for_file.split(".").last}"
    end
  end
end
