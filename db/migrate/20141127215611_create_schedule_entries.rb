class CreateScheduleEntries < ActiveRecord::Migration
  def change
    create_table :schedule_entries do |t|
      t.string :key
      t.string :pid
      t.string :title
      t.string :service
      t.string :synopsis
      t.timestamp :start_at
      t.timestamp :end_at
      t.boolean :loaded

      t.timestamps
    end
  end
end
