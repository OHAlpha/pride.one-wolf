class CreateRoles < ActiveRecord::Migration[5.0]
  def change
    create_table :roles do |t|
      t.references :organization, foreign_key: true
      t.string :name
      t.text :description
      t.integer :precedence

      t.timestamps
    end
  end
end
