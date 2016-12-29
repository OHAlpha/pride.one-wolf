class CreatePermissions < ActiveRecord::Migration[5.0]
  def change
    create_table :permissions do |t|
      t.string :name
      t.text :description
      t.references :parent, foreign_key: true

      t.timestamps
    end
  end
end
