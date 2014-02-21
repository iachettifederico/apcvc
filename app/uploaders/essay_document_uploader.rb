class EssayDocumentUploader < CarrierWave::Uploader::Base
  storage :dropbox

  def store_dir
    "#{model.class.to_s.underscore}/#{mounted_as}"
  end

  def filename
    "#{model.id}.pdf" if file
  end

  def extension_white_list
    %w(pdf)
  end

  def url
    "/essay/document/#{filename}"
  end
end
