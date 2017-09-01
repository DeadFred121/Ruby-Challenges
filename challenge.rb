require 'rubygems'
require 'weather-api'

clothing = {
  warm: ["shirt","hat","shorts"],
  cool: ["sweater","scarf","uggs"]
}

def print_clothes(clothes)
  clothes.each_index do |index|
    item = clothes[index]
    if index == 0
      puts "You should wear a " + item + ". "
    else
      puts "Also, probably wear a " + item + ". "
   end
 end
end


puts "Enter your city: "
user_city = gets.chomp

weather_user_city = Weather.lookup_by_location(user_city, Weather::Units::CELSIUS)

puts "Your city temperature is: #{weather_user_city.condition.temp}"

temp = weather_user_city.condition.temp.to_i

if temp >= 23
   print_clothes clothing [:warm]
else temp <= 23
   print_clothes clothing [:cool]
end
