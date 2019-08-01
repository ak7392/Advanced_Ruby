class Demo
 def self.for(object)
   @object = object
   get_binding
 end
 def self.get_binding
   @object.instance_eval{ binding }
 end
end

user_input = ''
until user_input == 'q' do
 user_input = gets.chomp
 b2 = Demo.get_binding
 puts eval('@object', b2)
end
