class AddColumnToEmails < ActiveRecord::Migration[5.0]
  def change
    add_column :emails, :email, :string
    add_index :emails, :email
  end
end
