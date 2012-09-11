class AddSystemIdToRules < ActiveRecord::Migration
  def change
    add_column :rules, :system_id, :integer
  end
end
