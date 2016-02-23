class CreateAvailabilities < ActiveRecord::Migration
  def change
    create_table :availabilities do |t|
      t.string :pid
      t.integer :version_id
      t.timestamp :start_at
      t.timestamp :end_at
      t.boolean :is_fully_loaded, default:false
      t.timestamps
    end
  end
end
