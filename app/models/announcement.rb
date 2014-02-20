class Announcement < ActiveRecord::Base
  validates :title, presence: true
  validates :content, presence: true
  validates :from_date, presence: true

  def <=>(other)
    if other.is_a?(Event)
      self.from_date.beginning_of_day <=> other.date.beginning_of_day
    else
      super
    end
  end

  def self.front_page
    where(front_page: true)
  end

  def self.published
    where('from_date >= ?', [DateTime.now.beginning_of_day])
  end
end
