class CreateGroups < ActiveRecord::Migration[5.1]
  def change
    create_table :groups do |t|
      t.string :name
      t.string :name50
      t.string :codgroup
      t.string :initial
      t.string :final
      t.references :chapter, foreign_key: true

      t.timestamps
    end
  end
end
