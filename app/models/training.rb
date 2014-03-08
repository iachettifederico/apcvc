class Training < ActiveRecord::Base
  #Settings[:admin_email]
  def self.[](key)
    self.where(key: key.to_s).first
  end
end
