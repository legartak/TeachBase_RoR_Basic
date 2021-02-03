# frozen_string_literal: true

# Area of triangle can be calculated, knowing its base (a) and height (h) by
# the formula: 1/2 * a * h. The program should query the base and height of
# the triangle and return its area.

print 'What\'s your triangle base length? '
base_a = gets.chomp.to_i

print 'What\'s your triangle height length? '
height_h = gets.chomp.to_i

area = 0.5 * base_a * height_h
puts "The area of your triangle is #{area}"
