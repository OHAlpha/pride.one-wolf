class CreatePeople < ActiveRecord::Migration[5.0]
  def change
    create_table :people do |t|
      t.string :person
      t.string :private_key
      t.references :added_by, foreign_key: true
      t.string :gender
      t.integer :state
      t.string :status
      t.text :details
      t.text :auxillary

      t.timestamps
    end
    add_index :people, :person, unique: true
    add_index :people, :private_key
  end
end
