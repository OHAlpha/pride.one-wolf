class CreateResidences < ActiveRecord::Migration[5.0]
  def change
    create_table :residences do |t|
      t.string :residence
      t.string :private_key
      t.references :person, foreign_key: true
      t.references :address, polymorphic: true
      t.references :added_by, foreign_key: true
      t.string :kind
      t.boolean :primary

      t.timestamps
    end
    add_index :residences, :residence, unique: true
    add_index :residences, :private_key
  end
end
