# frozen_string_literal: true

# Fill the array with Fibonacci numbers up to 100

result_array = [0, 1]
result_array.push(result_array[-1] + result_array[-2]) while result_array[-1] + result_array[-2] < 100
puts result_array.inspect
