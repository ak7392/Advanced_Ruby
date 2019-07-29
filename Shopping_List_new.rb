class ShoppingList
 attr_reader :list

 def initialize
   @list = {}
   @total = {}
 end

 def items(&block)
   self.instance_eval(&block)
 end

 def add(items, quantity)
    if list[items].nil?
      list[items] = quantity
    else
      list[items] += quantity
    end
  end

  def total
    total = list.values.map(&:to_i).inject(0, &:+)
  end

end

sl = ShoppingList.new

sl.items do
  add('Toothpaste', 2)
  add('Computer', 1)
  add('Toothpaste', 3)
end


p sl.list.inspect
p sl.list.keys.inspect
p sl.list.values.inspect
p sl.total
