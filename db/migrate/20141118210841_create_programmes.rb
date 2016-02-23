class CreateProgrammes < ActiveRecord::Migration
  def change
    create_table :programmes do |t|
      t.string :pid
      t.string :style
      t.string :title
      t.string :subtitle
      t.string :short_synopsis
      t.string :medium_synopsis
      t.string :long_synopsis
      t.integer :ownership_id
      t.boolean :is_fully_loaded, default:false
      t.timestamps
    end
  end
end
