class RemovePremiseIdFromRules < ActiveRecord::Migration
  def up
    remove_column :rules, :premise_id
  end

  def down
    add_column :rules, :premise_id, :integer
  end
end
