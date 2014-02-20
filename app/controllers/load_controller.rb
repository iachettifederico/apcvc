require "csv"
class LoadController < ApplicationController
  def books
    CsvBookLoader.new.load(params[:csv])
    redirect_to :back, notice: "Lista importada."
  end

  def events
    CsvEventLoader.new.load(params[:csv])
    redirect_to :back, notice: "Lista importada."
  end
end
