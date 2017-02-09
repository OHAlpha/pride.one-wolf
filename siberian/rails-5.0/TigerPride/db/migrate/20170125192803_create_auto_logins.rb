class CreateAutoLogins < ActiveRecord::Migration[5.0]
  def change
    create_table :auto_logins do |t|
      t.string :public_key
      t.string :private_key
      t.integer :date
      t.integer :ip

      t.timestamps
    end
  end
end
