module ApplicationHelper
  def actions
    if current_admin
      content_tag(:div, class: :admin_actions) do
        yield
      end
    end
  end

end
