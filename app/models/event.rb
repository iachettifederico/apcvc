class Event < ActiveRecord::Base
  validates :title, presence: true
  validates :date, presence: true

  mount_uploader :poster, EventPosterUploader

  def poster_file
    if poster
      @file ||= get_poster_file
    end
  end

  def destroy_poster_file
    dropbox_client.find("/Public/event/poster/#{id}.jpg").destroy
  end

  private
  def dropbox_client
    @dropbox_client ||= Dropbox::API::Client.new(token: ENV["DROPBOX_ACCESS_TOKEN"], secret: ENV["DROPBOX_ACCESS_TOKEN_SECRET"])
  end

  def get_poster_file
    dropbox_file = dropbox_client.download("Public/event/poster/#{id}.jpg")
  end

  # @client.search("#{id}.jpg").select do |file|
  #   File.dirname(file.path) == "Public/event/poster"
  # end.first
end
