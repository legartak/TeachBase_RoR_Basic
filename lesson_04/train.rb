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
  protected
  attr_writer :name
  attr_writer :type
  attr_writer :wagons
  attr_accessor :speed
  attr_accessor :train_route
  attr_accessor :current_station

  public
  attr_reader :type
  attr_reader :name
  attr_reader :wagons
  
  MESSAGES_HASH = {
    speed_error: 'You want to decrease speed, not increase',
    wagon_error: 'You need to stop if you want to change wagon configuration',
    last_station_error: 'You reached the end station, can`t move forward',
    first_station_error: 'You are at start station, can`t move backward',
    wagon_type_error: 'You are adding wagon with a wrong type'
  }.freeze

  def initialize(tr_name)
    self.name = tr_name
    self.type = :none
    self.wagons = []
    self.speed = 0
    self.train_route = nil
    self.current_station = 0
  end

  def increase_speed(new_speed)
    if new_speed < self.speed
      puts MESSAGES_HASH[:speed_error]
    else
      self.speed = new_speed
    end
  end

  def show_speed
    puts self.speed
  end

  def stop
    self.speed = 0 unless self.speed.zero?
    puts "#{name} has stopped."
  end

  def show_wagons
    wagons
  end

  def add_route(route)
    self.current_station = 0 unless self.current_station.zero?

    self.train_route = route.stations
  end

  def hook_wagon(wagon)
    if self.type != self.type
      puts MESSAGES_HASH[:wagon_error]
    else
      self.wagons << wagon
    end
  end

  def unhook_wagon
    self.wagons.pop(1)
  end

  def move_to_next_station
    if self.train_route[self.current_station] == self.train_route[-1]
      puts MESSAGES_HASH[:last_station_error]
    else
      self.current_station += 1
    end
  end

  def move_previous_station
    if self.train_route[self.current_station] == self.train_route[0]
      puts MESSAGES_HASH[:first_station_error]
    else
      self.current_station -= 1
    end
  end

  def show_previous_station
    puts self.train_route[self.current_station - 1]
  end

  def show_current_station
    puts self.train_route[self.current_station]
  end

  def show_next_station
    puts self.train_route[self.current_station + 1]
  end
end

class PassengerTrain < Train
  def initialize(name)
    super
    self.type = :passenger
  end  
end

class CargoTrain < Train
  def initialize(name)
    super
    self.type = :cargo
  end 
end

class Wagon
  private
  attr_writer :wagon_type

  public
  attr_reader :wagon_type

  def initialize
    self.wagon_type = :none
  end
end

class CargoWagon
  def initialize
    self.wagon_type = :cargo
  end
end

class PassengerWagon
  def initialize
    self.wagon_type = :passenger
  end
end