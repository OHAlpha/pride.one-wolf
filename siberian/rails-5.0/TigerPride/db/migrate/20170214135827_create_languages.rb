class CreateLanguages < ActiveRecord::Migration[5.0]
  def change
    create_table :languages do |t|
      t.references :person, foreign_key: true
      t.references :added_by, foreign_key: true
      t.string :language
      t.string :kind
      t.boolean :primary

      t.timestamps
    end
    add_index :languages, :language
  end
end
