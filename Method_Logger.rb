class MethodLogger
 def log_method((klass,method_name)
  klass.class_eval do
   alias_method "#{method_name}_original" method_name
   define_method method_name do
    puts "#{Time.now}: Called #{method_name} on #{self.class}"
    send "#{method_name}_original"
   end
  end
 end
end

end

class klass
end
k = klass.new
k.send :hello
