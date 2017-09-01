require "date"
#require "zodiac"

def zodiac_finder(user_birthday_day)

case user_birthday_day

        when 109..134
            "Aries"
        when 135..172
            "Taurus"
        when 173..201
            "Gemini"
        when 202..222
            "Cancer"
        when 223..259
            "Leo"
        when 260..304
            "Virgo"
        when 305..327
            "Libra"
        when 328..334
            "Scorpio"
        when 335..352
            "Ophiuchus"
        when 353..365
            "Sagittarius"
        when 1..19
            "Sagittarius"
        when 20..47
            "Capricorn"
        when 48..70
            "Aquarius"
        when 71..108
            "Pisces"
        end

end


fred_birthday = Date.new(1990,04,27)


puts "Enter your name: "
user_name = gets.chomp

puts "Enter your birthday like this 'yyyy-mm-dd': "
user_birthday = gets.chomp
new_user_birthday = Date.parse(user_birthday)

x = fred_birthday - new_user_birthday

puts "Your birthday is #{new_user_birthday}!"
puts "My birthday is #{fred_birthday}!"
puts "There are #{x.abs.to_i} days between our birthdays!"
puts "Your star-sign is: #{zodiac_finder(new_user_birthday.yday)}!"
#puts "Your star sign is #{new_user_birthday.zodiac_sign}!"
