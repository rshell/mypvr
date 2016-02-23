class CreateVersions < ActiveRecord::Migration
  def change
    create_table :versions do |t|
      t.integer :programme_id
      t.string :pid
      t.integer :duration
      t.boolean :is_fully_loaded, default:false
      t.timestamps
    end
  end
end
