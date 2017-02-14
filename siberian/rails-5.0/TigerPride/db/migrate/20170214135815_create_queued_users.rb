class CreateQueuedUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :queued_users do |t|
      t.string :queued_user
      t.string :private_key
      t.string :name
      t.string :email
      t.string :salt
      t.integer :iterations

      t.timestamps
    end
    add_index :queued_users, :queued_user, unique: true
    add_index :queued_users, :private_key
  end
end
