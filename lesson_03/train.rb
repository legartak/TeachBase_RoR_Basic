# frozen_string_literal: true

# It has a number (arbitrary string) and type (freight, passenger) and the
# number of wagons, these data are specified when creating an instance of the class.
# Can pick up speed.
# Can show current speed.
# Can slow down (drop speed to zero).
# Can show the number of wagons.
# Can hitch / unhitch wagons (one wagon per operation, the method simply
# increases or decreases the number of wagons). Coupling / uncoupling of wagons
# can be carried out only if the train is not moving.
# Can take a route to follow (object of the Route class)
# Can move between stations indicated in the route.
# Show previous station, current, next, based on route.

# Class that describes implementation of train
class Train
  MESSAGES_HASH = {
    speed_error: 'You want to decrease speed, not increase',
    wagon_error: 'You need to stop if you want to change wagon number',
    last_station_error: 'You reached the end station, can`t move forward',
    first_station_error: 'You are at start station, can`t move backward'
  }.freeze

  MESSAGES_HASH.freeze

  attr_reader :train_type

  def initialize(number, type, wagon_number)
    @train_number = number
    @train_type = type.to_sym
    @train_wagon_number = wagon_number
    @train_speed = 0
    @train_route = nil
    @current_station = 0
  end

  def increase_speed(new_speed)
    if new_speed < @train_speed
      puts MESSAGES_HASH[:speed_error]
    else
      @train_speed = new_speed
    end
  end

  def show_speed
    puts @train_speed
  end

  def stop
    @train_speed = 0
    puts "#{@train_number} has stopped."
  end

  def show_wagon_number
    puts @train_wagon_number
  end

  def wagon_increase
    if @train_speed.zero?
      @train_wagon_number += 1
    else
      puts MESSAGES_HASH[:wagon_error]
    end
  end

  def wagon_decrease
    if @train_speed.zero?
      @train_wagon_number -= 1
    else
      puts messages_hash[:wagon_error]
    end
  end

  def add_route(route)
    @train_route = route.stations
  end

  def move_to_next_station
    if @train_route[@current_station] == @train_route[-1]
      puts MESSAGES_HASH[:last_station_error]
    else
      @current_station += 1
    end
  end

  def move_previous_station
    if @train_route[@current_station] == @train_route[0]
      puts MESSAGES_HASH[:first_station_error]
    else
      @current_station -= 1
    end
  end

  def show_previous_station
    puts @train_route[@current_station - 1]
  end

  def show_current_station
    puts @train_route[@current_station]
  end

  def show_next_station
    puts @train_route[@current_station + 1]
  end
end
