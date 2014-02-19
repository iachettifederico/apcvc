class AdminController < ApplicationController
  before_filter :authenticate_admin!

  def index
    redirect_to root_path
  end
end
