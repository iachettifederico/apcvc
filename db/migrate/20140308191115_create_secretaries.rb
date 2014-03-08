class CreateSecretaries < ActiveRecord::Migration
  def change
    create_table :secretaries do |t|
      t.integer :order
      t.string :key
      t.string :name
      t.text :content

      t.timestamps
    end
  end
end
