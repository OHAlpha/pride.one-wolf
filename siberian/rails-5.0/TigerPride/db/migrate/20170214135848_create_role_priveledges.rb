class CreateRolePriveledges < ActiveRecord::Migration[5.0]
  def change
    create_table :role_priveledges do |t|
      t.references :owner, foreign_key: true
      t.references :target, foreign_key: true
      t.references :added_by, foreign_key: true

      t.timestamps
    end
  end
end
