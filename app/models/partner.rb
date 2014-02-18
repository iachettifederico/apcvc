Partner = Struct.new(:name, :position, :title) do
  def initialize(args={})
    args.each do |k, v|
      self.send("#{k}=", v)
    end
  end
end
