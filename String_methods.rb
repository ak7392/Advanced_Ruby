class NewClass < String
   # Returns true if the string is its own reverse.
   def self.default_method_call
   end

   def palindrome?
     self == reverse
   end

   def append(apnd = gets.chomp)
     to_s + "\n" + apnd
   end

   def call(method_name)
     if respond_to?(method_name)
       public_send(method_name)
     end
   end
end

puts " Select your method from 'palindrome?' or 'append' "
puts "Please enter the method name you wish to define:"
method_name = gets.chomp

puts "Please provide any optional arguments for entered method:"
code_str = gets.chomp

obj = NewClass.new(code_str)
puts obj.call(method_name)
