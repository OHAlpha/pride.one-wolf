class CreateOrganizations < ActiveRecord::Migration[5.0]
  def change
    create_table :organizations do |t|
      t.references :permission_set, foreign_key: true
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
