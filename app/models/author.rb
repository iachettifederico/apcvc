class Author
  include ActiveAttr::Model
  attribute :name
  attribute :title

  def initialize(args=nil)
    if args.is_a? String
      extract_from_string(args)
    elsif args.is_a? Hash
      self.name  = args["name"]  || args[:name]  || ""
      self.title = args["title"] || args[:title] || ""
    else
      super
    end
    sanitize(name)
    sanitize(title)
    switch_name_and_title
  end

  def to_s
    format(name, title)
  end

  def klass
    Author
  end

  private

  def switch_name_and_title
    self.title, self.name = "", self.title if self.title.present? && self.name.blank?
  end

  def extract_from_string(str)
    self.title, self.name = str.split(". ", 2)
  end

  def sanitize(str)
    str = str.to_s.gsub!("|", "")
  end

  def format(name, title)
    return "" unless name.present?
    dot = title.present? ? ". " : ""
    "#{title}#{dot}#{name}"
  end
end
