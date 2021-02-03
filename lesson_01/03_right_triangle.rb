# frozen_string_literal: true

# THe program asks from user 3 sides of triangle and determines whether is
# triangle right using the Pythagorean theorem and displays result on screen.
# Also, if a triangle is this with isosceles (that is, it has any 2 sides
# equal), then information is displayed that the triangle is also isosceles

triangle = []

print 'Input length of first side of triangle: '
triangle[0] = gets.chomp.to_f

print 'Input length of second side of triangle: '
triangle[1] = gets.chomp.to_f

print 'Input length of first side of triangle: '
triangle[2] = gets.chomp.to_f

triangle = triangle.sort.reverse

if triangle[0] == triangle[1] && triangle[1] == triangle[2]
  puts 'Your triangle is isosceles and equal, not right-angled.'
elsif triangle[1] == triangle[2]
  puts 'Yout triangle is isosceles.'
end

puts 'Your triangle is right-angled.' if triangle[0]**2 == (triangle[1]**2 + triangle[2]**2)
