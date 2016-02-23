class BroadcastAddService < ActiveRecord::Migration
  def change
    add_column :broadcasts,:service,:string
  end
end
