class CreateNamePrefixes < ActiveRecord::Migration[5.0]
  def change
    create_table :name_prefixes do |t|
      t.string :name
      t.string :abbreviation

      t.timestamps
    end
  end
end
