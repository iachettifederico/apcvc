class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :title
      t.string :url
      t.datetime :pubdate

      t.timestamps
    end
  end
end
