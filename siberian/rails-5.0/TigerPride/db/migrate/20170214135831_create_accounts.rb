class CreateAccounts < ActiveRecord::Migration[5.0]
  def change
    create_table :accounts do |t|
      t.string :account
      t.string :private_key
      t.references :user, foreign_key: true
      t.string :name
      t.text :description
      t.string :display

      t.timestamps
    end
    add_index :accounts, :account, unique: true
    add_index :accounts, :private_key
  end
end
