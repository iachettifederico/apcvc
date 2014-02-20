class CsvBookLoader
  def load(csv)
    book_attrs = []
    CSV.foreach(csv.path, headers: true) do |row|
      attrs = row.to_hash
      attrs.delete("id")
      book_attrs << attrs
    end
    Book.create!(book_attrs)
  end
end
