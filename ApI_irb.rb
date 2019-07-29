require 'pry'

class Bind
  def get_binding(param)
    binding.pry
  end
end

obj = Bind.new
input = gets.chomp
obj.get_binding(input)
b.eval("param")
