# frozen_string_literal: true

# Three numbers are given, they indicate the day, month, year(we ask the user).
# Find the serial number of the date starting from the beginning of the year.
# Please note that the year can be a leap year.

messages_hash = {
  input_day: 'What\'s the day? ',
  input_month: 'What\'s the month? ',
  input_year: 'What\'s the year? '
}

check_lambda = lambda do |message|
  loop do
    print message
    variable = gets.chomp.to_i
    return variable unless variable <= 0
  end
end

months_array = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]

day = check_lambda.call(messages_hash[:input_day])
month = check_lambda.call(messages_hash[:input_month])
year = check_lambda.call(messages_hash[:input_year])

months_array[1] = 29 if ((year % 4).zero? && year % 100 != 0) || (year % 400).zero?

date_number = 0
if month > 1
  (0...(month - 1)).each { |c_month| date_number += months_array[c_month] }
  date_number += day
else
  date_number = day
end

puts date_number
