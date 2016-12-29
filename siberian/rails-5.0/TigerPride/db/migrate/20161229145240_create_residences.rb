class CreateResidences < ActiveRecord::Migration[5.0]
  def change
    create_table :residences do |t|
      t.references :person, foreign_key: true
      t.references :address, polymorphic: true
      t.string :kind
      t.boolean :primary

      t.timestamps
    end
  end
end
