
# items = [
#   {customer: "John", item: "Soup", cost: 8.50},
#   {customer: "Sarah", item: "Pasta", cost: 12},
#   {customer: "John", item: "Coke", cost: 2.50}
#]
def print_items(name)
    customer = {
        "John" => [:soup, :coke],
        "Sarah" => [:pasta]
    }
    item = {
        soup: 8.50,
        pasta: 12,
        coke: 2.50
    }
    total = 0
    puts name
    customer[name].each do |purchased|
        total = total + item[purchased]
       puts "#{purchased.to_s}: $#{'%.2f' % item[purchased]}"
    end
    puts "Total: $"'%.2f' % total
end



puts "Press 1 to calculate customer total."
puts "Press 2 to add a customer."
puts "Press 3 to add new menu item."
answer = gets.chomp.to_i
#name = gets.chomp.capitalize!

if answer == 1
    puts "Enter a customer's name: "

    name = gets.chomp.capitalize

    puts name
    print_items(name)

elsif answer == 2
    puts "Enter new customer name: "
    new_name = gets.chomp.capitalize!

elsif answer == 3
    puts "Enter new item name: "
    new_item = gets.chomp.capitalize!
    puts "Enter new item price: "
    new_item_price = gets.chomp.to_i
end

#print_items(name)
