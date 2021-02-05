# frozen_string_literal: true

# Has a start and end station and a list of intermediate stations. The starting
# and ending stations are specified when creating a route, and intermediate
# stations can be added between them.
# Can add an intermediate station to the list.
# Can remove an intermediate station from the list.
# Can list all stations in order from start to end.

# Class that describes implementation of route
class Route
  attr_reader :stations

  def initialize(start_station, end_station)
    @stations = []
    @stations.push(start_station.name, end_station.name)
  end

  def add_intermediate_station(station_name)
    @stations.insert(-2, station_name)
  end

  def delete_station(station_name)
    if @stations.length < 3
      puts 'Hey, you have only two stations: start and end.'
    else
      @stations.delete(station_name)
    end
  end

  def show_route
    @stations.each { |station| puts station }
  end
end
