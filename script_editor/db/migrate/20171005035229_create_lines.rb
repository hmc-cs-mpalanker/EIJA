class CreateLines < ActiveRecord::Migration[5.0]
  def change
    create_table :lines do |t|
      t.integer :number
      t.string :words

      t.timestamps
    end
  end
end
