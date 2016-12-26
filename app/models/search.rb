class Search

  def self.search(start_station, end_station)
    common_routes = start_station.routes & end_station.routes
    trains = []
    common_routes.each do |route|
      if start_station.index_station_in(route) < end_station.index_station_in(route)
        trains << route.trains
      end
    end
    trains.flatten!
  end
end