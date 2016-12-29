class CreatePhones < ActiveRecord::Migration[5.0]
  def change
    create_table :phones do |t|
      t.references :person, foreign_key: true
      t.string :number
      t.string :provider
      t.string :kind
      t.boolean :primary

      t.timestamps
    end
    add_index :phones, :number
    add_index :phones, :provider
  end
end
