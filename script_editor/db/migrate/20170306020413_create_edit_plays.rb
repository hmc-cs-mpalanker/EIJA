class CreateEditPlays < ActiveRecord::Migration[5.0]
  def change
    create_table :edit_plays do |t|
      t.string :play

      t.timestamps
    end
  end
end
