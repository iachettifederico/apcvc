class Feed
  include ActiveAttr::Model
  include Enumerable

  def initialize(*collections)
    @collections = collections.flatten.sort.reverse
  end

  def each
    @collections.each do |e|
      yield e
    end
  end
end
