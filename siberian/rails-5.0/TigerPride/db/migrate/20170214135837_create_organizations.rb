class CreateOrganizations < ActiveRecord::Migration[5.0]
  def change
    create_table :organizations do |t|
      t.string :organization
      t.string :private_key
      t.references :parent, foreign_key: true
      t.references :permission_set, foreign_key: true
      t.references :added_by, foreign_key: true
      t.string :name
      t.text :description
      t.integer :state
      t.string :status
      t.text :details
      t.text :auxillary

      t.timestamps
    end
    add_index :organizations, :organization, unique: true
    add_index :organizations, :private_key
  end
end
