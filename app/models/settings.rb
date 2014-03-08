class Settings < ActiveRecord::Base
  #Settings[:admin_email]
  def self.[](key)
    setting = get_setting(key)
    setting && setting.value
  end

  def self.[]=(key, value)
    setting = get_setting(key)
    if setting
      setting.value = value
      setting.save!
    else
      self.create!(key: key, value: value)
    end
  end

  private

  def self.get_setting(key)
    self.where(key: key.to_s).first
  end
end
