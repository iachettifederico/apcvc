class MenuPresenter < RailsPresenter::Base
  def item_link(title, path)
    h.link_to(path) do
      h.content_tag(:span, title) +
      h.content_tag(:div, title)
    end
  end

  class Menu; end
end
