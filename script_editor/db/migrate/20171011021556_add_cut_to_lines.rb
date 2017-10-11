class AddCutToLines < ActiveRecord::Migration[5.0]
  def change
    add_column :lines, :cut, :boolean, default: false; 
  end
end
