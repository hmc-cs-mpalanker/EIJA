class CreateWords < ActiveRecord::Migration[5.0]
  def change
    create_table :words do |t|
      t.string :text
      t.integer :line_id
      t.integer :place

      t.timestamps
    end
  end
end
