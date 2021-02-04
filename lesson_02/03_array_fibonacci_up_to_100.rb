# frozen_string_literal: true

# Fill the array with Fibonacci numbers up to 100

result_array = [0, 1]

loop do
  new_number = result_array[-1] + result_array[-2]
  break if new_number > 100

  result_array << new_number
end

puts result_array.inspect
