# frozen_string_literal: true

# Fill hash with vowels, where is value will be serial number in alphabet
# ex. ('a' - 1)

puts %w[a e i o u y].inject({}) { |memo, let| memo[let] = ('a'..'z').to_a.find_index(let) + 1; memo }
