class CreateCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :categories do |t|
      t.string :name
      t.string :name50
      t.string :codcat
      t.string :ehsubcat
      t.references :group, foreign_key: true
      t.references :restriction, foreign_key: true

      t.timestamps
    end
  end
end
