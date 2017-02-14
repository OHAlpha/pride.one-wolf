class CreateLogins < ActiveRecord::Migration[5.0]
  def change
    create_table :logins do |t|
      t.string :login
      t.string :private_key
      t.references :account, foreign_key: true
      t.references :email, foreign_key: true
      t.string :client_salt
      t.string :server_salt
      t.integer :iterations
      t.string :passhash
      t.string :version
      t.boolean :primary

      t.timestamps
    end
    add_index :logins, :login, unique: true
    add_index :logins, :private_key
  end
end
