class CreateThreeNames < ActiveRecord::Migration[5.0]
  def change
    create_table :three_names do |t|
      t.string :title
      t.string :given
      t.string :middle
      t.string :family
      t.string :suffix

      t.timestamps
    end
    add_index :three_names, :given
    add_index :three_names, :family
  end
end
