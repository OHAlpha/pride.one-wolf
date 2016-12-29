class CreateForcedGroupIps < ActiveRecord::Migration[5.0]
  def change
    create_table :forced_group_ips do |t|
      t.references :group, foreign_key: true
      t.integer :low
      t.integer :high
      t.text :details

      t.timestamps
    end
  end
end
