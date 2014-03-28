class HomeController < ApplicationController
  def index
    feed = Feed.new(Announcement.published.front_page, Event.published.front_page).to_a
    @announcements = feed
    @poster = get_poster
  end

  private

  def get_poster
    repo  = PicasaWebAlbums.get_repository(ENV["GOOGLE_USER"], ENV["GOOGLE_PASS"])
    album_id = repo.get_album_by_title("Porttada").id
    photos = repo.get_photos_by_album_id(album_id)
    photos.sort_by(&:id).last.url
  rescue TypeError
    "http://lh5.googleusercontent.com/-7UCU9MGy8wM/UYGV1_JWlxI/AAAAAAAAACA/6AcX20UG_58/w540-h538-no/Logo+APCVCtrasparente.png"
  end
end
