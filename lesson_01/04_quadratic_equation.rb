# frozen_string_literal: true

# User enters 3 coefficients a, b and c. The program calculates the discriminant
# (D) and roots of the equation (x1 and x2, if any) and displays the values of
# the discriminant and roots on the screen

print 'Writhe A coefficient: '
coef_a = gets.chomp.to_f

print 'Writhe B coefficient: '
coef_b = gets.chomp.to_f

print 'Writhe C coefficient: '
coef_c = gets.chomp.to_f

discriminant = coef_b**2 - (4 * coef_a * coef_c)
lower_part = (2 * coef_a)

if discriminant.negative?
  puts 'There is no roots!'
elsif discriminant.zero?
  x1 = -coef_b / lower_part
  puts "There is 1 root, x1: #{x1}"
else
  x1 = (-coef_b - Math.sqrt(discriminant)) / lower_part
  x2 = (-coef_b + Math.sqrt(discriminant)) / lower_part
  puts "There are 2 roots, x1: #{x1} and x2: #{x2}"
end
