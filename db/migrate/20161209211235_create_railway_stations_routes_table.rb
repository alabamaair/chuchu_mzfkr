class CreateRailwayStationsRoutesTable < ActiveRecord::Migration[5.0]
  def change
    create_table :railway_stations_routes do |t|
      t.belongs_to :railway_station, index: true
      t.belongs_to :route, index: true
      t.timestamps
    end
  end
end
