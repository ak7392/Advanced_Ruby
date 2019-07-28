class ShoppingList
 attr_reader :list
 attr_accessor :total

 def initialize
   @list = []
   @total = 0
 end

 def add(items, quantity)
   if @list.include?(items) == false
     @list << [items, quantity]
   else
     @list
   end
 end

 def items(&block)
   block.call
 end

 def total
  quantities = list.map { |item| item[1] }
  total = quantities.inject(0){|sum,x| sum + x }
 end
end

sl = ShoppingList.new

sl.items do
  sl.add('Toothpaste', 2)
  sl.add('Computer', 1)
  sl.add('Toothpaste', 3)
end

puts sl.list
puts sl.total
