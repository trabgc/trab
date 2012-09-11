class AddRuleIdToConclusions < ActiveRecord::Migration
  def change
    add_column :conclusions, :rule_id, :integer
  end
end
