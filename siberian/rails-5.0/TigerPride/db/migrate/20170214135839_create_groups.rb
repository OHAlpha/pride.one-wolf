class CreateGroups < ActiveRecord::Migration[5.0]
  def change
    create_table :groups do |t|
      t.string :group
      t.string :private_key
      t.references :organization, foreign_key: true
      t.references :added_by, foreign_key: true
      t.string :name
      t.text :description
      t.integer :precedence
      t.bigint :perm_add
      t.bigint :perm_remove
      t.text :perm
      t.integer :state
      t.string :status
      t.text :details
      t.text :auxillary

      t.timestamps
    end
    add_index :groups, :group, unique: true
    add_index :groups, :private_key
  end
end
