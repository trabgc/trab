class AddRuleIdToPremises < ActiveRecord::Migration
  def change
    add_column :premises, :rule_id, :integer
  end
end
