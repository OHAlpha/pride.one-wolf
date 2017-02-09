class CreateQueuedUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :queued_users do |t|
      t.string :name
      t.string :email
      t.string :salt
      t.integer :iterations

      t.timestamps
    end
  end
end
