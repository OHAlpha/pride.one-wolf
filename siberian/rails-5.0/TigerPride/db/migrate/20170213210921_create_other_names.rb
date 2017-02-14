class CreateOtherNames < ActiveRecord::Migration[5.0]
  def change
    create_table :other_names do |t|
      t.string :name

      t.timestamps
    end
    add_index :other_names, :name
  end
end
