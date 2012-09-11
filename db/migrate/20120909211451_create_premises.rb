class CreatePremises < ActiveRecord::Migration
  def change
    create_table :premises do |t|
      t.integer :variable_id
      t.integer :value_id

      t.timestamps
    end
  end
end
