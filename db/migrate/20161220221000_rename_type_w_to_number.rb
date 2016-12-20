class RenameTypeWToNumber < ActiveRecord::Migration[5.0]
  def change
    rename_column :wagons, :type_w, :number
  end
end
