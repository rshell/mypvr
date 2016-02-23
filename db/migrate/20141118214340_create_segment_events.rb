class CreateSegmentEvents < ActiveRecord::Migration
  def change
    create_table :segment_events do |t|
      t.string :pid
      t.integer :segment_id
      t.integer :version_offset
      t.string :title
      t.boolean :is_chapter
      t.boolean :has_snippet

      t.timestamps
    end
  end
end
