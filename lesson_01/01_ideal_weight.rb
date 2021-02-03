# frozen_string_literal: true

# Program asks user his name and height and displays ideal weight by formula
# <height> - 110, after what displays result to user, calling him by name.
# If ideal weight is negative, the message displays "Your weight is already
# optimal".

print 'What is your name? '
name = gets.chomp

print 'What is your height? '
height = gets.chomp.to_i

ideal_weight = height - 110

if ideal_weight.negative?
  puts 'Your weight is already optimal.'
else
  puts "#{name}, your idela weight is #{ideal_weight}."
end
