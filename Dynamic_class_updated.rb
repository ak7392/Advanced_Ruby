class A
  def self.some_method method,*_params
    puts "#{name}: defining #{method}"
    define_method method do |*args|
      puts "#{self.class.name}: called #{method}"

      klass = self.class
      klass = klass.superclass while !klass.instance_methods(false).include?(method)

      # klass is now where the instance method is defined
      # and you can now access its class variables etc.
      puts "#{klass.name}: has method #{method}"
    end
  end
end

class B < A
end

A.some_method :foo

B.new.foo
