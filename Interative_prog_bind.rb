class Foo
  attr_reader :b
  def initialize(n)
    @n = n
    @b = binding
  end

  def self.run(n, code)
    foo  = self.new(n)
    foo.b.eval(code)
  end
end

input = gets.chomp
Foo.run(input, "p @n, defined?(foo)")
