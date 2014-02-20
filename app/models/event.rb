class Event < ActiveRecord::Base
  validates :title, presence: true
  validates :date, presence: true

  mount_uploader :poster, EventPosterUploader

  def poster_file
    if !persisted? || poster.present?
      @file ||= get_poster_file
    end
  end

  def destroy_poster_file
    dropbox_client.find("#{dropbox_dir}/#{id}.jpg").destroy
  end

  def <=>(other)
    if other.is_a?(Announcement)
      self.date.beginning_of_day <=> other.from_date.beginning_of_day
    else
      super
    end
  end

  def self.front_page
    where(front_page: true)
  end

  def self.announcements
    where(announcement: true)
  end

  def self.published
    where("date >= ?", [DateTime.now.beginning_of_day])
  end

  private
  def dropbox_client
    @dropbox_client ||= Dropbox::API::Client.new(token: ENV["DROPBOX_ACCESS_TOKEN"], secret: ENV["DROPBOX_ACCESS_TOKEN_SECRET"])
  end

  def dropbox_dir
    "event/poster"
  end

  def get_poster_file
    dropbox_file = dropbox_client.download("#{dropbox_dir}/#{id}.jpg")
  end

  # @client.search("#{id}.jpg").select do |file|
  #   File.dirname(file.path) == "Public/event/poster"
  # end.first
end
