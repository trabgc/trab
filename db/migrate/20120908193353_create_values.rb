class CreateValues < ActiveRecord::Migration
  def change
    create_table :values do |t|
      t.string :description
      t.integer :variable_id

      t.timestamps
    end
  end
end
