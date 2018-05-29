class CreateClassifications < ActiveRecord::Migration[5.1]
  def change
    create_table :classifications do |t|
      t.string :type
      t.string :codrefer
      t.string :name

      t.timestamps
    end
  end
end
