# frozen_string_literal: true

# Fill hash with vowels, where is value will be serial number in alphabite
# ex. ('a' - 1)

array_of_vowels = %w[a e i o u y]
array_alphabite = ('a'..'z').to_a
hash_vowels = {}

array_of_vowels.each do |vowel|
  hash_vowels[vowel] = array_alphabite.find_index(vowel) + 1
end

puts hash_vowels.inspect
