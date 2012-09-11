class CreateSystems < ActiveRecord::Migration
  def change
    create_table :systems do |t|
      t.string :description
      t.integer :variable_id

      t.timestamps
    end
  end
end
