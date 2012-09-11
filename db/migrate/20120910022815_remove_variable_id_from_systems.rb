class RemoveVariableIdFromSystems < ActiveRecord::Migration
  def up
    remove_column :systems, :variable_id
  end

  def down
    add_column :systems, :variable_id, :integer
  end
end
