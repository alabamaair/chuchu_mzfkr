class SearchesController < ApplicationController
  def show
    @stations = RailwayStation.all
  end

  def create
    @start_station = RailwayStation.find(params[:start_station][:railway_station_id])
    @end_station = RailwayStation.find(params[:end_station][:railway_station_id])

    @trains = Search.search(@start_station, @end_station)

    render 'searches/_result'
  end

end
