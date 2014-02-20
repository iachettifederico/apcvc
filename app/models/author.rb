Author = Struct.new(:name, :title) do
  def initialize(args={})
    args.each do |k, v|
      self.send("#{k}=", v)
    end
  end

  def to_s
    "#{title.capitalize}. #{name}"
  end
end
