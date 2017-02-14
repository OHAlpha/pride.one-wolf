class CreateCredentials < ActiveRecord::Migration[5.0]
  def change
    create_table :credentials do |t|
      t.string :credential
      t.string :private_key
      t.references :account, foreign_key: true
      t.bigint :perm_override_add
      t.bigint :perm_override_remove
      t.text :perm_override

      t.timestamps
    end
    add_index :credentials, :credential, unique: true
    add_index :credentials, :private_key
  end
end
