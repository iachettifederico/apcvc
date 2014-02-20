class BookPresenter < RailsPresenter::Base
  def edition
    super.present? ? super : "--"
  end

  def year
    super.to_i > 0 ? super : "--"
  end
end
