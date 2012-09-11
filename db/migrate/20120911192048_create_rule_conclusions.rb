class CreateRuleConclusions < ActiveRecord::Migration
  def change
    create_table :rule_conclusions do |t|
      t.integer :rule_id
      t.integer :conclusion_id

      t.timestamps
    end
  end
end
