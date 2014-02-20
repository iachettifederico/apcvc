class AddFrontPageAndAnnouncementToEvents < ActiveRecord::Migration
  def change
    add_column :events, :front_page, :boolean
    add_column :events, :announcement, :boolean
  end
end
