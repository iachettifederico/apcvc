class Essay < ActiveRecord::Base
  validates :title, presence: true
  validates :authors, presence: true
  validates :abstract, presence: true
  validates :document, presence: true

  mount_uploader :document, EssayDocumentUploader

  def document_file
    if !persisted? || document.present?
      @file ||= get_document_file
    end
  end

  def destroy_document_file
    dropbox_client.find("#{dropbox_dir}/#{id}.pdf").destroy
  end

  def authors
    read_attribute(:authors)
      .to_s
      .gsub(/(?<=\A)\||\|(?=\z)/, "")
      .split("|")
      .map do |full_name|
      Author.new(full_name)
    end
  end

  def authors=(*authors)
    write_attribute(:authors, authors.join("|"))
  end

  def <=>(other)
    if other.is_a? Video
      self.created_at <=> other.created_at
    else
      super
    end
  end


  private
  def dropbox_client
    @dropbox_client ||= Dropbox::API::Client
      .new(token: ENV["DROPBOX_ACCESS_TOKEN"],
           secret: ENV["DROPBOX_ACCESS_TOKEN_SECRET"])
  end

  def dropbox_dir
    "essay/document"
  end

  def get_document_file
    dropbox_file = dropbox_client.download("#{dropbox_dir}/#{id}.pdf")
  end
end
