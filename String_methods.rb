class NewClass < String
   # Returns true if the string is its own reverse.
   def initialize(class_name)
     @klass = Class.new
     Object.const_set(class_name, @klass)
     display_methods
   end

   def palindrome?
     self == self.reverse
   end

   def append(apnd)
     self.to_s + "\n" + apnd
   end

   def new_method(method_name, code_str)
     @klass.instance_eval do
         define_method(method_name) { eval "#{code_str}"}
     end
   end

   def call(method_name)
     if @klass.respond_to?(method_name)
       @klass.public_send(method_name)
     end
   end
end

puts "Please enter the class name:"
class_name = gets.chomp

puts " Select your method from 'palindrome?' or 'append' "

puts "Please enter the method name you wish to define:"
method_name = gets.chomp

puts "Please provide any optional arguments for entered method:"
code_str = gets.chomp

puts obj = NewClass.new(class_name)
puts obj.method(method_name).call
