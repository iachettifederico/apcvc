class CreateSettings < ActiveRecord::Migration
  def change
    create_table :settings do |t|
      t.integer :order
      t.string :key
      t.text :value
      t.string :field_type
      t.string :description

      t.timestamps
    end
  end
end
