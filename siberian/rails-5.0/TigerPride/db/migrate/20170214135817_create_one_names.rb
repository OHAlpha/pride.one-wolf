class CreateOneNames < ActiveRecord::Migration[5.0]
  def change
    create_table :one_names do |t|
      t.string :name
      t.integer :uses

      t.timestamps
    end
    add_index :one_names, :name
  end
end
