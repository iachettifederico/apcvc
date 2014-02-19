class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.date :date
      t.text :content
      t.string :poster

      t.timestamps
    end
  end
end
