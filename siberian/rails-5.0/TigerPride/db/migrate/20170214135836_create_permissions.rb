class CreatePermissions < ActiveRecord::Migration[5.0]
  def change
    create_table :permissions do |t|
      t.references :permission_set, foreign_key: true
      t.string :name
      t.text :description
      t.string :kind
      t.string :visibility
      t.string :key

      t.timestamps
    end
  end
end
