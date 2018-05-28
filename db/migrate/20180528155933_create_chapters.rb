class CreateChapters < ActiveRecord::Migration[5.1]
  def change
    create_table :chapters do |t|
      t.string :name
      t.string :name50
      t.string :numcap
      t.string :codcap
      t.string :roman
      t.string :initial
      t.string :final
      t.references :cid10, foreign_key: true

      t.timestamps
    end
  end
end
