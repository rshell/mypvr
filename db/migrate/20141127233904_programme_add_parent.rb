class ProgrammeAddParent < ActiveRecord::Migration
  def change
    add_column :programmes,:parent_id,:integer
  end
end
