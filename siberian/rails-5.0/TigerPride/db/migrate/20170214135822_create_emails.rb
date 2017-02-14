class CreateEmails < ActiveRecord::Migration[5.0]
  def change
    create_table :emails do |t|
      t.references :person, foreign_key: true
      t.references :added_by, foreign_key: true
      t.string :address
      t.string :provider
      t.string :kind
      t.boolean :primary

      t.timestamps
    end
    add_index :emails, :address
    add_index :emails, :provider
  end
end
