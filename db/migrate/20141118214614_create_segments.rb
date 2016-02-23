class CreateSegments < ActiveRecord::Migration
  def change
    create_table :segments do |t|
      t.string :pid
      t.integer :duration
      t.string :artist
      t.string :track_title
      t.integer :track_number
      t.string :record_label
      t.string :release_title
      t.string :record_id
      t.string :snippet_url
      t.string :title
      t.string :short_synopsis
      t.string :medium_synopsis
      t.string :long_synopsis
      t.timestamps
    end
  end
end
