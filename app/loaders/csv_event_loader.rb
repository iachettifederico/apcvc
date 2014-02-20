# -*- coding: utf-8 -*-
class CsvEventLoader
  def load(csv)
    event_attrs = []
    CSV.foreach(csv.path, headers: true) do |row|
      attrs = {
        title:        row["title"],
        date:         row["date"],
        content:      row["content"],
        poster:       row["poster"],
        front_page:   is_front_page?(row),
        announcement: is_announcement?(row),
      }
      event_attrs << attrs
    end
    Event.create!(event_attrs)
  end

  private
  def is_front_page?(attrs)
    is_announcement?(attrs)
  end

  def is_announcement?(attrs)
    filter_announcement_by_prefix(attrs)
  end

  def filter_announcement_by_prefix(row)
    [
     "reunion",
     "reunión",
     "jornada",
    ].all? { |prefix|
      !row["title"].downcase.starts_with?(prefix)
    }

  end
end
