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

  def value
    if field_type == "boolean"
      !!(read_attribute(:value) != "f")
    else
      read_attribute(:value)
    end
  end


  def value=(v)
    if field_type == "boolean"
      v = v == "1"
      write_attribute(:value, v)
    else
      write_attribute(:value, v)
    end
  end
  private

  def self.get_setting(key)
    self.where(key: key.to_s).first
  end
end
