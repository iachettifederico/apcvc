class CreateTrainings < ActiveRecord::Migration
  def change
    create_table :trainings do |t|
      t.integer :order
      t.string :key
      t.string :title
      t.text :content

      t.timestamps
    end
  end
end
