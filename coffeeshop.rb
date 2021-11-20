require_relative 'wallet.rb'

@coffee_shop = [
  {name: "latte", category: "hot drinks", price: 2.50},
  {name: "soda", category: "cold drinks", price: 1.0},
  {name: "scone", category: "food", price: 3.75},
  {name: "black coffee", category: "hot drinks", price: 1.25}
]


def start
  puts "Welcome to Meg's coffee shop! How much do you have to spend at the cafe?"
  money = gets.strip.to_f

  @wallet = Wallet.new(money)
  if @wallet.validate_money(money)
    puts "Your current balence is $ #{@wallet.current_balance}"
    view_menu
  else 
    puts "Sorry, invalid amount, please try again!"
    view_menu
  end
end


def view_menu
  @coffee_shop.each_with_index do |item, index|
    puts "#{index + 1}. #{item[:name]} -- #{item[:category]} #{item[:price]}"
  end
end

def handle_purchase(index)
  money = @wallet.current_balance - @coffee_shop[index][:price]
  if @wallet.validate_money(money)
    @wallet.subtract_money(@coffee_shop[index][:price])
    puts "Your balance is now $#{@wallet.current_balance}"
    puts "Enjoy your treat!"
  else
    puts "Sorry, you can't purchase this item!"
  end
end

def app 
  start
  @option = gets.strip.to_i

  case @option
  when 1
    handle_purchase(@option -1)
  when 2
    handle_purchase(@option -1)
  when 3
    handle_purchase(@option -1)
  when 4
    handle_purchase(@option -1)
  when 5
    exit
  else 
    puts "Please use a number to select your item"
    app
  end
end

app