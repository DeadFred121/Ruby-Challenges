$list = {}


def shopping_list(my_list)

  ordered_list = my_list.sort.to_h
  puts "You have #{ordered_list.length} items."
  puts "Your items are: "
  ordered_list.each {|item, quantity| puts "#{item.ljust(15)} x #{quantity}"}


end


3.times do
  puts "Enter a Grocery Item: "
  item = gets.chomp
  item = "Broccoli" if item == "Ice Cream"

  puts "Enter a quantity: "
  quantity = gets.chomp

  $list[item] = quantity

end

shopping_list($list)
