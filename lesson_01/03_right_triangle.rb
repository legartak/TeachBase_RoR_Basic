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

messages_hash = {
	input_first_side: 'Input length of first side of triangle: ',
	input_second_side: 'Input length of second side of triangle: ',
	input_third_side: 'Input length of third side of triangle: ',
	equal_triangle: 'Your triangle is isosceles and equal, not right-angled.',
	isosceles_triangle: 'Yout triangle is isosceles.',
	right_angled_triangle: 'Your triangle is right-angled.',
	usual_triangle: 'This is a usual triangle',
	not_a_triangle: 'This is not a triangle!'
}

print messages_hash[:input_first_side]
triangle[0] = gets.chomp.to_f

triangle[0] = lambda_check.call(messages_hash[:input_first_side]) while triangle[0].negative?

print messages_hash[:input_second_side]
triangle[1] = gets.chomp.to_f

triangle[1] = lambda_check.call(messages_hash[:input_second_side]) while triangle[1].negative?

print messages_hash[:input_third_side]
triangle[2] = gets.chomp.to_f

triangle[2] = lambda_check.call(messages_hash[:input_third_side]) while triangle[2].negative?

triangle = triangle.sort.reverse
is_triangle = triangle[0] < triangle[1] + triangle[2]

if is_triangle
  if triangle[0] == triangle[1] && triangle[1] == triangle[2]
    puts messages_hash[:equal_triangle]
  elsif triangle[1] == triangle[2]
    puts messages_hash[:isosceles_triangle]
  elsif triangle[0]**2 == (triangle[1]**2 + triangle[2]**2)
    puts messages_hash[:right_angled_triangle]
  else
    puts messages_hash[:usual_triangle]
  end
else
  puts messages_hash[:not_a_triangle]
end
