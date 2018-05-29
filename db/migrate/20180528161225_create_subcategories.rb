class CreateSubcategories < ActiveRecord::Migration[5.1]
  def change
    create_table :subcategories do |t|
      t.string :name
      t.string :name50
      t.string :codsubcat
      t.references :category, foreign_key: true
      t.references :restricion, foreign_key: true
      t.references :classification, foreign_key: true

      t.timestamps
    end
  end
end
