class Store

    attr_reader :cart, :products

    def initialize
        @cart = Hash.new(0)
        @products = Hash.new
    end

    def add_to_cart(item, quantity)
        if products.has_key? item
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
        cart.map {|k, v| products[k] * v }.reduce(:+)
    end

    def products_list
        products.keys
    end
end

store = Store.new
store.add_product("ToothPaste", 2)
store.add_product("Computer", 1)
puts "Products available in cart with quantity"
puts store.products
store.add_to_cart("ToothPaste", 45)
store.add_to_cart("Computer", 37428)
puts "List all items with their prices"
puts store.cart
puts "cart total"
puts store.cart_total
