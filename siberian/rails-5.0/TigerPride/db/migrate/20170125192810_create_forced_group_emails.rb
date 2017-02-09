class CreateForcedGroupEmails < ActiveRecord::Migration[5.0]
  def change
    create_table :forced_group_emails do |t|
      t.references :group, foreign_key: true
      t.string :regex
      t.text :details

      t.timestamps
    end
  end
end
