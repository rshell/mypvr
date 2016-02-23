class CreateProgrammePeers < ActiveRecord::Migration
  def change
    create_table :programme_peers do |t|
      t.integer :from_programme_id
      t.integer :to_programe_id
      t.string :style

      t.timestamps
    end
  end
end
