class RailwayStation < ApplicationRecord
  has_many :railway_stations_routes
  has_many :routes, through: :railway_stations_routes
  has_many :trains, foreign_key: :current_station_id

  scope :ordered, -> { joins(:railway_stations_routes).order('railway_stations_routes.index_station ASC').uniq }
  #scope :ordered, -> { order('index_station ASC') }

  def update_index_station(route, index_station, arrival, departure)
    station_route = station_route(route)
    if station_route
      @station_route.index_station = index_station
      @station_route.arrival = arrival
      @station_route.departure = departure
      @station_route.save
    end
  end

  def index_station_in(route)
    station_route(route).try(:index_station)
  end

  def arrival_in(route)
    t = station_route(route).try(:arrival)
    t.to_s(:time) if t
  end

  def departure_in(route)
    t = station_route(route).try(:departure)
    t.to_s(:time) if t
  end

  private

  def station_route(route)
    @station_route = railway_stations_routes.where(route: route).first
  end

end
