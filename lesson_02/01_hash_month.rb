# frozen_string_literal: true

# Task is to make hash, which contains months and quantity of days in a month.
# In cycle display month that have day quantity only 30.

months_hash = {
  'January' => 31,
  'February' => 28,
  'February (leap year)' => 29,
  'March' => 31,
  'April' => 30,
  'May' => 31,
  'June' => 30,
  'July' => 31,
  'August' => 31,
  'September' => 30,
  'October' => 31,
  'November' => 30,
  'December' => 31
}

puts 'Here is a list of month, that has quantity of days 30.'
months_hash.each { |key, value| puts key if value == 30 }
