class CreateOtherAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :other_addresses do |t|
      t.text :address

      t.timestamps
    end
  end
end
