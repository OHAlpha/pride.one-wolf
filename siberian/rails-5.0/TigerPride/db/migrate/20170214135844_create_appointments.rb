class CreateAppointments < ActiveRecord::Migration[5.0]
  def change
    create_table :appointments do |t|
      t.string :appointment
      t.string :private_key
      t.references :account, foreign_key: true
      t.references :role, foreign_key: true
      t.references :authorized_by, foreign_key: true
      t.integer :state
      t.string :status
      t.text :details
      t.text :auxillary

      t.timestamps
    end
    add_index :appointments, :appointment, unique: true
    add_index :appointments, :private_key
  end
end
