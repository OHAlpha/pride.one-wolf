class CreateRelationships < ActiveRecord::Migration[5.0]
  def change
    create_table :relationships do |t|
      t.references :person_a, foreign_key: true
      t.references :person_b, foreign_key: true
      t.string :kind
      t.references :added_by, foreign_key: true

      t.timestamps
    end
  end
end
