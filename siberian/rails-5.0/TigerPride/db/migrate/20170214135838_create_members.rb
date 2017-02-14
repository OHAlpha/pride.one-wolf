class CreateMembers < ActiveRecord::Migration[5.0]
  def change
    create_table :members do |t|
      t.string :member
      t.string :private_key
      t.references :account, foreign_key: true
      t.references :organization, foreign_key: true
      t.references :authorized_by, foreign_key: true
      t.integer :state
      t.string :status
      t.text :details
      t.text :auxillary

      t.timestamps
    end
    add_index :members, :member, unique: true
    add_index :members, :private_key
  end
end
