class CreateClassifications < ActiveRecord::Migration[5.1]
  def change
    create_table :classifications do |t|
      t.string :estate
      t.string :reference, default: nil

      t.timestamps
    end
  end
end
