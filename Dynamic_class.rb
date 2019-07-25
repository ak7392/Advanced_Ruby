class MethodCreator
  def initialize(class_name)
    @klass = Class.new
    Object.const_set(class_name, @klass)
  end
  def new_method(method_name, code_str)
    @klass.instance_eval do
        define_method(method_name) { instance_eval(code_str)}
    end
  end
  def call(method_name)
    @klass.new.send(method_name)
  end
end

puts "Please enter the class name:"
class_name = gets.chomp
# => User
puts "Please enter the method name you wish to define:"
# => greet
method_name = gets.chomp
puts "Please enter the method's code:"
code_str = gets.chomp
# => greet"Welcome from #{self.class} class. I am #{self}"

obj = MethodCreator.new(class_name)
puts obj.new_method(method_name, code_str)

puts "Hello, Your class User with method greet is ready. Calling: User.new.greet:"
puts obj.call(method_name)
# => Welcome from User class. I am #<User:0x00007f8575b51da8>
