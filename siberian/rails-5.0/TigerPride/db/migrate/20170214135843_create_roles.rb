class CreateRoles < ActiveRecord::Migration[5.0]
  def change
    create_table :roles do |t|
      t.string :role
      t.string :private_key
      t.references :organization, foreign_key: true
      t.references :added_by, foreign_key: true
      t.string :name
      t.text :description
      t.integer :precedence
      t.integer :state
      t.string :status
      t.text :details
      t.text :auxillary

      t.timestamps
    end
    add_index :roles, :role, unique: true
    add_index :roles, :private_key
  end
end
