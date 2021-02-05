# frozen_string_literal: true

# The user alternately enters the name of the product, the unit price and the
# quantity of the purchased product (can be a non-integer number). The user can
# enter an arbitrary number of products until he enters "stop" as the name of
# the product. Based on the entered data, the following is required:
#  -Fill in and display a hash, the keys of which are the names of the goods,
#   and the value is a nested hash containing the price per unit of the goods
#   and the quantity of the purchased goods. Also display the total amount for
#   each item.
#  - Calculate and display the total of all purchases in the "shopping cart".

messages_hash = {
  name_input: 'What\'s new item? ',
  price_input: 'What\'s the price? ',
  quantity_input: 'What\'s the quantity of item? '
}
shopping_cart = {}

total = 0

loop do
  print messages_hash[:name_input]
  name = gets.chomp
  break if name == 'stop'

  print messages_hash[:price_input]
  price = gets.chomp.to_f
  print messages_hash[:quantity_input]
  quantity = gets.chomp.to_f

  shopping_cart[name] = { price => quantity }
  total += price * quantity
end

shopping_cart.each do |key1, value1|
  print "#{key1}: "
  value1.each do |key2, value2|
    print "#{key2}$, #{value2} pcs. Subtotal: #{key2 * value2} \n"
  end
end

puts "Total amount is: #{total}$"
