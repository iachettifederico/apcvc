class VideoPresenter < RailsPresenter::Base
  def to_s
    id = read_attribute("url")[/v=([a-zA-Z0-9]+)/, 1]
    "//www.youtube.com/embed/#{id}"
  end
end
