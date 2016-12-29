class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.references :person, foreign_key: true
      t.string :name
      t.string :email
      t.string :client_salt
      t.string :server_salt
      t.integer :iterations
      t.string :passhash
      t.bigint :perm_override_add
      t.bigint :perm_override_remove
      t.text :perm_override
      t.integer :reg_date
      t.integer :reg_ip
      t.integer :log_dat
      t.integer :log_ip
      t.integer :state
      t.string :status
      t.text :details
      t.text :auxillary

      t.timestamps
    end
    add_index :users, :name, unique: true
    add_index :users, :email, unique: true
  end
end
