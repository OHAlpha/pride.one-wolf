class CreateAutoLogins < ActiveRecord::Migration[5.0]
  def change
    create_table :auto_logins do |t|
      t.string :auto_login
      t.string :private_key
      t.references :login, foreign_key: true
      t.string :public_key
      t.string :private_key
      t.integer :date
      t.integer :ip

      t.timestamps
    end
    add_index :auto_logins, :auto_login, unique: true
    add_index :auto_logins, :private_key
  end
end
