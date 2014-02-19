# -*- coding: utf-8 -*-
class CalendarPresenter < RailsPresenter::Base
  def month
    date.strftime("%B %Y")
  end

  def weekdays
    %W[Lunes Martes Miércoles Jueves Viernes Sábado Domingo]
  end

  def weeks
    first = date.beginning_of_month.beginning_of_week(start_day)
    last  = date.end_of_month.end_of_week(start_day)
    (first..last).to_a.in_groups_of(7)
  end

  def day_cell(day)
    content_tag :td, view.capture(day, &callback), class: day_classes(day)
  end

  def day_classes(day, date)
    classes = []
    classes << "today" if day == Date.today
    classes << "notmonth" if day.month != date.month
    classes.join(" ")
  end

  def month_word(month)
    %W[enero febrero marzo abril mayo junio julio agosto septiembre octubre noviembre diciembre][month-1]
  end

  private

  def start_day
    :monday
  end
end
