class CreateProgrammeCategories < ActiveRecord::Migration
  def change
    create_table :programme_categories do |t|
      t.integer :programme_id
      t.integer :category_id

      t.timestamps
    end
  end
end
