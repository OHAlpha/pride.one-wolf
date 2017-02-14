class CreatePermissionSets < ActiveRecord::Migration[5.0]
  def change
    create_table :permission_sets do |t|
      t.string :permission_set
      t.string :private_key
      t.integer :permissions

      t.timestamps
    end
    add_index :permission_sets, :permission_set, unique: true
    add_index :permission_sets, :private_key
  end
end
