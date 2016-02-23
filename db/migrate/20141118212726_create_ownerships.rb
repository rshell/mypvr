class CreateOwnerships < ActiveRecord::Migration
  def change
    create_table :ownerships do |t|
      t.string :style
      t.string :bbc_id
      t.string :key
      t.timestamps
    end
  end
end
