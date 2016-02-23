class CreateBroadcasts < ActiveRecord::Migration
  def change
    create_table :broadcasts do |t|
      t.string :pid
      t.date :schedule_date
      t.timestamp :start_at
      t.timestamp :end_at
      t.integer :duration
      t.boolean :is_fully_loaded, default:false
      t.timestamps
    end
  end
end
