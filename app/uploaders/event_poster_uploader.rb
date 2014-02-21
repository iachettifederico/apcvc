class EventPosterUploader < CarrierWave::Uploader::Base
  include CarrierWave::RMagick

  storage :dropbox

  process resize_to_limit: [600, nil]

  def store_dir
    "#{model.class.to_s.underscore}/#{mounted_as}"
  end

  def filename
    "#{model.id}.jpg" if file
  end

  def extension_white_list
    %w(jpg)
  end
end
