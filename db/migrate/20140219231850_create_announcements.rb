class CreateAnnouncements < ActiveRecord::Migration
  def change
    create_table :announcements do |t|
      t.string :title
      t.text :content
      t.datetime :from
      t.datetime :to
      t.boolean :front_page

      t.timestamps
    end
  end
end
