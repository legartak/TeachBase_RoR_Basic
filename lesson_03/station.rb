# frozen_string_literal: true

# Has name, which sets up when object creates
# It can receive trains (one at a time)
# Can show list of all trains at the station, locating at this moment
# Can show list of trains at the station by type: number of freight, passenger
# Can send trains (one at a time and the train is removed from the list of
# trains at the station).

# Class that describes implementation of station
class Station
  attr_reader :name

  def initialize(st_name)
    @name = st_name
    @train_array = []
  end

  def train_receive(train)
    @train_array.push train
  end

  def show_all_trains
    @train_array
  end

  def show_by_type
    count_passenger = 0
    count_freight = 0

    @train_array.each do |x|
      if x.train_type == :passenger
        count_passenger += 1
      else
        count_freight += 1
      end
    end

    puts "Number of passenger trains is #{count_passenger}"
    puts "Number of freight trains is #{count_freight}"
  end

  def train_send(train)
    @train_array.delete train
  end
end
