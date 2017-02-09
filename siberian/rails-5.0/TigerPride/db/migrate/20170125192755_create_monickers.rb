class CreateMonickers < ActiveRecord::Migration[5.0]
  def change
    create_table :monickers do |t|
      t.references :person, foreign_key: true
      t.references :name, polymorphic: true
      t.string :kind
      t.boolean :primary

      t.timestamps
    end
  end
end
