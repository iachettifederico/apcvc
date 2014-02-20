class HomeController < ApplicationController
  def index
    feed = Feed.new(Announcement.published.front_page, Event.published.front_page).to_a
    @announcements = feed
  end
end
