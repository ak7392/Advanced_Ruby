require 'irb'
class C
    def my_method
        @var = 'hi'
        $my_binding = binding
        IRB.start(__FILE__)
    end
end

C.new.my_method
