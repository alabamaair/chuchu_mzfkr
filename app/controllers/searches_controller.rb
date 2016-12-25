class SearchesController < ApplicationController
  def show
    @stations = RailwayStation.all
  end

  def create
    @start_station = RailwayStation.find(params[:start_station][:railway_station_id])
    @end_station = RailwayStation.find(params[:end_station][:railway_station_id])
    common_routes = @start_station.routes & @end_station.routes
    @trains = []
    common_routes.each do |route|
      if @start_station.index_station_in(route) < @end_station.index_station_in(route)
        @trains << route.trains
      end
    end
    @trains.flatten!

    render 'searches/_result'
  end

end
