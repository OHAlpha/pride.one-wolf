class CreateAssignments < ActiveRecord::Migration[5.0]
  def change
    create_table :assignments do |t|
      t.string :assignment
      t.string :private_key
      t.references :account, foreign_key: true
      t.references :group, foreign_key: true
      t.references :authorized_by, foreign_key: true
      t.integer :state
      t.string :status
      t.text :details
      t.text :auxillary

      t.timestamps
    end
    add_index :assignments, :assignment, unique: true
    add_index :assignments, :private_key
  end
end
