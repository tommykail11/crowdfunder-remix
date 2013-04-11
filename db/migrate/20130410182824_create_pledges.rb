class CreatePledges < ActiveRecord::Migration
  def change
    create_table :pledges do |t|
      t.integer :amount
      t.references :project

      t.timestamps
    end
    add_index :pledges, :project_id
  end
end
