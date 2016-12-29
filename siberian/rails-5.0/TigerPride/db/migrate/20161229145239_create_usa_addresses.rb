class CreateUsaAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :usa_addresses do |t|
      t.string :name
      t.string :number
      t.string :street
      t.string :apartment
      t.string :city
      t.string :state
      t.integer :zipcode
      t.integer :extension

      t.timestamps
    end
    add_index :usa_addresses, :name
    add_index :usa_addresses, :street
    add_index :usa_addresses, :city
    add_index :usa_addresses, :state
    add_index :usa_addresses, :zipcode
  end
end
