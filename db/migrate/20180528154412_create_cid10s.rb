class CreateCid10s < ActiveRecord::Migration[5.1]
  def change
    create_table :cid10s do |t|
      t.string :version

      t.timestamps
    end
  end
end
