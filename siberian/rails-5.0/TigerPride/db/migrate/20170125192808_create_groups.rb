class CreateGroups < ActiveRecord::Migration[5.0]
  def change
    create_table :groups do |t|
      t.references :organization, foreign_key: true
      t.string :name
      t.text :description
      t.integer :precedence
      t.bigint :perm_add
      t.bigint :perm_remove
      t.text :perm

      t.timestamps
    end
  end
end
