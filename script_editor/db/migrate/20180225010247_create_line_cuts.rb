class CreateLineCuts < ActiveRecord::Migration[5.0]
  def change
    create_table :line_cuts do |t|

      t.timestamps
    end
  end
end
