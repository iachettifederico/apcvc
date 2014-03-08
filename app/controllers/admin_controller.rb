class AdminController < ApplicationController
  before_filter :authenticate_admin!

  def index
    if params["some_page"]
      redirect_to "/" + params["some_page"]
    else
      redirect_to root_path
    end
  end

  def settings
    settings = Settings.order(:order)

    render "settings", locals: { settings: settings}
  end
end
