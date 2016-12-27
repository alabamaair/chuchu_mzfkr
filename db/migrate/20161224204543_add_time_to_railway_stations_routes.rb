class AddTimeToRailwayStationsRoutes < ActiveRecord::Migration[5.0]
  def change
    add_column :railway_stations_routes, :arrival, :time
    add_column :railway_stations_routes, :departure, :time
  end
end
