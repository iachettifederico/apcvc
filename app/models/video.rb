class Video < ActiveRecord::Base
  def <=>(other)
    if other.is_a? Essay
      self.created_at <=> other.created_at
    else
      super
    end
  end
end
