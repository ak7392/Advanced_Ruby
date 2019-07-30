class ShoppingList
 attr_accessor :list
 attr_accessor :total

 def initialize
   @list = Hash.new(0)
   @total = 0
 end

 def items(&block)
   self.instance_eval(&block)
 end

 def add(items, quantity)
   list[items] += quantity
   @total += quantity
 end
end

sl = ShoppingList.new

sl.items do
  add('Toothpaste', 2)
  add('Computer', 1)
  add('Toothpaste', 3)
end


p sl.list
p sl.list.keys
p sl.list.values
p sl.total
