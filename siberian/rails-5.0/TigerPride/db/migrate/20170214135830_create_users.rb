class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :user
      t.string :private_key
      t.references :person, foreign_key: true
      t.string :name
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
    add_index :users, :user, unique: true
    add_index :users, :private_key
    add_index :users, :name, unique: true
  end
end
