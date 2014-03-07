class CreateDirComission < ActiveRecord::Migration
  def change
    create_table :dir_comissions do |t|
      t.integer :order
      t.string :name
      t.string :position
      t.string :title

      t.timestamps
    end
  end
end
