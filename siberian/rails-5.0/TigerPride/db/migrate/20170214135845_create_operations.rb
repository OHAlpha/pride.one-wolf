class CreateOperations < ActiveRecord::Migration[5.0]
  def change
    create_table :operations do |t|
      t.string :name
      t.text :description
      t.references :parent, foreign_key: true

      t.timestamps
    end
  end
end
