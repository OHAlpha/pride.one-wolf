class CreatePermissionSets < ActiveRecord::Migration[5.0]
  def change
    create_table :permission_sets do |t|

      t.timestamps
    end
  end
end
