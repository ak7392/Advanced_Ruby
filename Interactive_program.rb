class Demo
  def initialize(n)
    @secret = n
  end
  def get_binding
    binding
  end
end


# k1 = Demo.new("")
# b1 = k1.get_binding
k2 = Demo.new("Hello")
b2 = k2.get_binding



# puts eval("@secre", b1)
puts eval("@secre", b2)
