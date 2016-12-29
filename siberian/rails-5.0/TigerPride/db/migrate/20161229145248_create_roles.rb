class CreateRoles < ActiveRecord::Migration[5.0]
  def change
    create_table :roles do |t|
      t.string :name
      t.text :description
      t.integer :precedence

      t.timestamps
    end
  end
end
