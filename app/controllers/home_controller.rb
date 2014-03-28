class HomeController < ApplicationController
  def index
    feed = Feed.new(Announcement.published.front_page, Event.published.front_page).to_a
    @announcements = feed
    @poster = get_poster
  end

  private

  def get_poster
    repo  = PicasaWebAlbums.get_repository(ENV["GOOGLE_USER"], ENV["GOOGLE_PASS"])
    album_id = repo.get_album_by_title("Portada").id
    photos = repo.get_photos_by_album_id(album_id)
    photos.sort_by(&:id).last.url
  rescue TypeError
    "http://www.libreriapaidos.com/eventos/ImageFetch.ashx?Size=2&ImageID=5626"
  end
end
