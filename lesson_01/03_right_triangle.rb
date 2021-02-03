# frozen_string_literal: true

# THe program asks from user 3 sides of triangle and determines whether is
# triangle right using the Pythagorean theorem and displays result on screen.
# Also, if a triangle is this with isosceles (that is, it has any 2 sides
# equal), then information is displayed that the triangle is also isosceles

triangle = []

lambda_check = lambda { |message|
  print message
  gets.chomp.to_i
}

print 'Input length of first side of triangle: '
triangle[0] = gets.chomp.to_f

triangle[0] = lambda_check.call('Input length of first side of triangle: ') while triangle[0].negative?

print 'Input length of second side of triangle: '
triangle[1] = gets.chomp.to_f

triangle[1] = lambda_check.call('Input length of second side of triangle: ') while triangle[1].negative?

print 'Input length of third side of triangle: '
triangle[2] = gets.chomp.to_f

triangle[2] = lambda_check.call('Input length of third side of triangle: ') while triangle[2].negative?

triangle = triangle.sort.reverse
is_triangle = triangle[0] + triangle[1] > triangle[2] && triangle[1] + triangle[2] > triangle[0] && triangle[2] + triangle[0] > triangle[1]

if is_triangle
  if triangle[0] == triangle[1] && triangle[1] == triangle[2]
    puts 'Your triangle is isosceles and equal, not right-angled.'
  elsif triangle[1] == triangle[2]
    puts 'Yout triangle is isosceles.'
  end

  if triangle[0]**2 == (triangle[1]**2 + triangle[2]**2)
    puts 'Your triangle is right-angled.'
  else
    puts 'This is a usual triangle'
  end
else
  puts 'This is not a triangle!'
end
