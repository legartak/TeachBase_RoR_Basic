# frozen_string_literal: true

# Fill array with numbers from 10 to 100 with step 5

result_array = (2..20).to_a
result_array.map! { |x| x * 5 }
puts result_array.inspect
