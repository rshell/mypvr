class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :style
      t.string :key
      t.string :bbc_id
      t.string :parent_id
      t.timestamps
    end
  end
end
