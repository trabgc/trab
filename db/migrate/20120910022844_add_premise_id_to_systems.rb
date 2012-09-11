class AddPremiseIdToSystems < ActiveRecord::Migration
  def change
    add_column :systems, :premise_id, :integer
  end
end
