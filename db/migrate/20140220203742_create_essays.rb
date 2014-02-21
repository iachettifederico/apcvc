class CreateEssays < ActiveRecord::Migration
  def change
    create_table :essays do |t|
      t.string :title
      t.string :document
      t.string :authors
      t.text :abstract

      t.timestamps
    end
  end
end
