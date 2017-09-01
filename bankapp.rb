require 'exchange'

def give_options
    puts "-----------------------------------------------------"
    # puts "Press 0 to create a new account."
    puts "Press 1 to see your transaction history."
    puts "Press 2 to deposit funds."
    puts "Press 3 to withdraw funds."
    puts "Press 4 to display Balance."
    puts "Press 9 to exit."
    puts "-----------------------------------------------------"
end


# def modify_proc(@pin)
#
# begin
#   puts "Enter PIN"
#   pin = gets.chomp
#   if pin == @pin
#     puts "Please re-enter the PIN to confirm:"
#     pin_2 = gets.chomp
#     if pin_2 == @pin
#     puts "Accepted!"
#     end
#   elsif pin != @pin
#     puts "PIN is incorrect."
#     raise "failure"
#   end
#   rescue
#     puts "Please re-enter PIN"
#     retry
#   end
# end
#
#
#
#
# def account_create
#   puts "Please enter your name:"
#   acct_name = gets.chomp
#   puts "Please enter your email:"
#   acct_email = gets.chomp
#   puts "Please enter your phone number:"
#   acct_ph_num = gets.chomp
#   puts "Please enter a PIN:"
#   acct_pin = gets.chomp.to_i
#   puts "Please re-enter PIN:"
#   pin_2 = gets.chomp
#     if acct_pin == pin_2




class Account
  attr_accessor :name, :balance, :email, :phone

  def initialize (customer)
    @name = customer[:name]
    @balance = customer[:balance]
    @email = customer[:email]
    @phone = customer[:phone]
    @pin = customer[:pin]
    @transaction_history = {
      deposits: [],
      withdrawals: []
    }
  end

  def change_pin(old_pin, new_pin)
  end

  def currency_convert(to)
    currency_converted = @balance.in(:aud).to(to.to_sym)
    puts "-------------------------------"
    puts "Your converted balance is #{currency_converted}"
  end

  # def gbp_balance
  #   gbp_converted = @balance.in(:aud).to(:gbp)
  #   puts "-------------------------------"
  #   puts "Your GBP converted balance is #{gbp_converted}"
  # end

  def show_transaction_history

    puts "Transaction History:"
    puts "Deposits: " + @transaction_history[:deposits] * ', '
    puts "Withdrawls: " + @transaction_history[:withdrawals] * ', '

  end

  def display_balance
    puts "Your balance is: #{@balance}"
    puts "Would you like do convert your balance?"
    selection = gets.chomp.upcase

    if selection != "YES"
      puts "Your balance is #{@balance}"
      return
    end
    begin
      puts "Enter a currency code:"
      conversion_selection = gets.chomp.downcase
      currency_convert(conversion_selection)
    rescue
      puts "Invalid Currency Code entered!"
      retry
    end
  end


  def deposit_money
    puts "Enter the amount you wish to deposit:"
    dep_amount = gets.chomp.to_i
    @balance = @balance + dep_amount
     @transaction_history[:deposits].push(dep_amount)
  end

  def withdraw_money
    puts "Enter PIN:"
    begin
      entered_pin = gets.chomp.to_i
      if entered_pin == @pin
        puts "Enter the amount you wish to withdraw:"
        withdrawal = gets.chomp.to_i
        if (@balance - withdrawal) > 0
          @balance -= withdrawal
          @transaction_history[:withdrawals].push(withdrawal)
        else
        puts "Insufficient Funds!"
        end
      else
        puts "PIN is incorrect!"
        raise "arrrggg"
      end
    rescue
      puts "Please re-enter the correct pin"
      retry
    end
  end

end

account = Account.new({ name: "Sam", balance: 0, email: "", phone: 0, pin: 1234 })

option = 0

begin

  give_options
  option = gets.chomp.to_i

  case option
  when 1
    account.show_transaction_history
  when 2
    account.deposit_money
  when 3
    account.withdraw_money
  when 4
    account.display_balance
  when 9
    exit
  end

end until option == 9
