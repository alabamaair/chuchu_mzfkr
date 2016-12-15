class CreateWagons < ActiveRecord::Migration[5.0]
  def change
    create_table :wagons do |t|
      t.string :type_w
      t.integer :low_seats
      t.integer :top_seats
      t.belongs_to :train

      t.timestamps
    end
  end
end
