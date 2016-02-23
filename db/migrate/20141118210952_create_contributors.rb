class CreateContributors < ActiveRecord::Migration
  def change
    create_table :contributors do |t|
      t.string :character_name
      t.string :name
      t.string :family_name
      t.string :given_name
      t.string :role
      t.boolean :is_fully_loaded, default:false
      t.timestamps
    end
  end
end
