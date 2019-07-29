class Store

    attr_reader :cart, :products # you need to access the variables
    @done_shopping = false

    def initialize
        @cart = Hash.new(0) # initilize the Hash with default value
        @products = Hash.new
    end

    def add_to_cart(item, quantity)
        # increase by quantity, thanks to default value of the Hash,
        # only if the product is available
        if products.has_key? item # products thanks to the attr_reader, then see Hash docs
            cart[item] += quantity
            true
        else
            false
        end
    end

    def add_product(item, price)
        products[item] = price
    end

    def cart_total
        # cart.sum { |k, v| products[k] * v }
        cart.map {|k, v| products[k] * v }.reduce(:+)
    end

    def products_list
        products.keys
    end

    def display(item, quantity, price)
      puts "Do you wish to add more items enter yes or no "
      temp = gets.chomp

      if temp == 'no'
        @done_shopping = false
      else
        puts "Enter the item"
        item = gets.chomp
        puts " Enter the quanity"
        quanity = gets.chomp.to_i
        puts " Enter the price"
        price = gets.chomp.to_i
        cart[item] = quantity.to_i
        cart[item] = price.to_i
      end
    end

end

puts "Enter the item"
item = gets.chomp
puts " Enter the quanity"
quanity = gets.chomp.to_i
puts " Enter the price"
price = gets.chomp.to_i

store = Store.new
store.display(item, quanity, price)
puts store.cart
puts store.cart_total
