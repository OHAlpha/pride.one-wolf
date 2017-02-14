class CreateMonickers < ActiveRecord::Migration[5.0]
  def change
    create_table :monickers do |t|
      t.string :monicker
      t.string :private_key
      t.references :person, foreign_key: true
      t.references :name, polymorphic: true
      t.references :added_by, foreign_key: true
      t.string :kind
      t.boolean :primary

      t.timestamps
    end
    add_index :monickers, :monicker, unique: true
    add_index :monickers, :private_key
  end
end
