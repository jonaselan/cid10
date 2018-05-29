class CreateRestrictions < ActiveRecord::Migration[5.1]
  def change
    create_table :restrictions do |t|
      t.string :type
      t.string :description

      t.timestamps
    end
  end
end
