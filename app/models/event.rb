class Event < ActiveRecord::Base
  validates :title, presence: true
  validates :date, presence: true

  mount_uploader :poster, EventPosterUploader

  def poster_file
    @file ||= get_poster_file
  end

  private
  def get_poster_file
    client = Dropbox::API::Client.new(token: ENV["DROPBOX_ACCESS_TOKEN"], secret: ENV["DROPBOX_ACCESS_TOKEN_SECRET"])
    # The result is a hash, so we need to call a method on the client, supplying the right key from the hash
    dropbox_file = client.download("Public/event/poster/#{id}.jpg")
    # Tempfile.open(%W[poster #{id} .jpg], Rails.root.join('tmp')) do |f|
    #   f.binmode
    #   f.write(dropbox_file)
    #   File.open(f)
    # end
  end

  # @client.search("#{id}.jpg").select do |file|
  #   File.dirname(file.path) == "Public/event/poster"
  # end.first
end
