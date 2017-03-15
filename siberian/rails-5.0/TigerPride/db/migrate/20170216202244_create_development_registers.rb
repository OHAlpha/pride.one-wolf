class CreateDevelopmentRegisters < ActiveRecord::Migration[5.0]
  def change
    create_table :development_registers do |t|
      t.string :name
      t.string :email
      t.string :password
      t.string :client_salt
      t.integer :iterations
      t.string :client_hash
      t.string :server_salt
      t.string :server_hash

      t.timestamps
    end
  end
end
