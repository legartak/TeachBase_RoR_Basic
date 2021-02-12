# frozen_string_literal: true

require_relative 'station'
require_relative 'route'
require_relative 'train'

SELECTOR_HASH = {
  start_message: 'Choose number from 1 to 6 or type \'exit\' to stop program',
  create_station: '1. Create new station',
  create_train: '2. Create new train',
  add_wagon: '3. Add new wagon to the train',
  unhook_wagon: '4. Unhook wagon from the train',
  place_train: '5. Place train at the station',
  check_stations_trains: '6. Check the list of stations and list of trains on it'
}.freeze

QUESTIONS_HASH = {
  station_name: 'What is the name of your station? ',
  station_place: 'On what station you want to place train? ',
  station_shower: 'It`s a list of all stations and it`s trains: ',
  train_type: 'What type of train you want to create(type \'passenger\' or \'cargo\')? ',
  train_name: 'What`s the name of your train? ',
  train_send: 'What train do you want to send? ',
  wagon_adder: 'For which train you want add wagon? ',
  wagon_type: 'What kind of wagon do you want to add(type \'passenger\' or \'cargo\')? ',
  wagon_deleter: 'For which train you want delete wagon? '
}.freeze

ERRORS_HASH = {
  wagon_mix: 'You want to mix train and wagon types. Train obj will not be updated!',
  no_train: 'There is no such train!',
  no_station: 'There is no such station!',
  no_wagons: 'There is no wagons in the train!'
}.freeze

array_stations = []
array_trains = []

def new_station(array_stations)
  print QUESTIONS_HASH[:station_name]
  station_name = gets.chomp
  array_stations << Station.new(station_name)
  puts "Station \"#{array_stations[-1].name}\" was created!"
end

def new_train(array_trains)
  print QUESTIONS_HASH[:train_name]
  train_name = gets.chomp

  train_type = ''
  loop do
    print QUESTIONS_HASH[:train_type]
    train_type = gets.chomp
    break if %w[passenger cargo].include?(train_type)
  end
  array_trains << (train_type == 'passenger' ? PassengerTrain.new(train_name) : CargoTrain.new(train_name))
  puts "#{train_type.capitalize} train \"#{array_trains[-1].name}\" was created!"
end

def find_train(array_trains)
  train_name4_find = gets.chomp

  temp_value = nil
  array_trains.each do |train|
    temp_value = train if train.name == train_name4_find
  end

  temp_value
end

def new_wagon(array_trains)
  print QUESTIONS_HASH[:wagon_adder]
  train_index = array_trains.find_index(find_train(array_trains))

  type = ''
  loop do
    print QUESTIONS_HASH[:wagon_type]
    type = gets.chomp
    break if %w[passenger cargo passenger cargo cargo passenger].include?(type)
  end
  if train_index.nil?
    puts ERRORS_HASH[:no_train]
    return
  end

  if array_trains[train_index].type == :cargo && type == 'cargo'
    array_trains[train_index].hook_wagon(CargoWagon.new)
  elsif array_trains[train_index] == :passenger && type == 'passenger'
    array_trains[train_index].wagon_hook(PassengerTrain.new)
  else
    puts ERRORS_HASH[:wagon_mix]
  end
  puts "#{type.capitalize} wagon was added to #{array_trains[train_index].name} train"
end

def delete_wagon(array_trains)
  print QUESTIONS_HASH[:wagon_deleter]
  train_index = array_trains.find_index(find_train(array_trains))
  if train_index.nil?
    puts ERRORS_HASH[:no_train]
    return
  end

  if array_trains[train_index].wagons.length !empty?
    array_trains[train_index].unhook_wagon
  else
    puts ERRORS_HASH[:no_wagons]
  end
  puts "Wagon was deleted from #{array_trains[train_index].name} train!"
end

def find_station(array_stations)
  station_name4_find = gets.chomp

  temp_value = nil
  array_stations.each do |station|
    temp_value = station if station.name == station_name4_find
  end

  temp_value
end

def place_train(array_trains, array_stations)
  print QUESTIONS_HASH[:train_send]
  train_index = array_trains.find_index(find_train(array_trains))
  if train_index.nil?
    puts ERRORS_HASH[:no_train]
    return
  end

  print QUESTIONS_HASH[:station_place]
  station_index = array_stations.find_index(find_station(array_stations))
  if station_index.nil?
    puts ERRORS_HASH[:no_station]
    return
  end

  array_stations[-1].train_receive(array_trains[train_index])
  puts "Train \"#{array_trains[train_index].name}\" was moved to station \"#{array_stations[station_index].name}\"!"
  array_trains.delete_at(train_index)
end

def show_all_stations(array_stations)
  puts QUESTIONS_HASH[:station_shower]
  array_stations.each do |station|
    puts "Station \"#{station.name}\", it`s trains:"
    station.show_all_trains
  end
end

loop do
  puts "\n"
  SELECTOR_HASH.each { |_key, value| puts value.to_s }

  puts "\n"
  point = gets.chomp
  break if point == 'exit'

  point = point.to_i
  next if point < 1 || point > 6

  case point
  when 1 then new_station(array_stations)
  when 2 then new_train(array_trains)
  when 3 then new_wagon(array_trains)
  when 4 then delete_wagon(array_trains)
  when 5 then place_train array_trains, array_stations
  when 6 then show_all_stations(array_stations)
  end
end
