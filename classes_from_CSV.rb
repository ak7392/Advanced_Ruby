require 'csv'

class CsvManipulator
  def first_line_csv
    CSV.open("Input.csv", 'r') { |csv| csv.first }
  end

  def remaining_line_csv
    text = File.readlines("Input.csv")[1..-1].join()
    csv = CSV.parse(text, headers: true)
  end
end

class MethodCreator < CsvManipulator
  def initialize(class_name)
    @klass = Class.new
    Object.const_set(class_name, @klass)
  end
  def new_method(method_name, code_str)
    @klass.class_eval do
      puts define_method(method_name) { "#{code_str}" }
    end
  end
  def call(method_name)
    @klass.new.send(method_name)
  end
end

class_name  = "Input"
obj = MethodCreator.new(class_name)
method_name = (obj.first_line_csv).join(', ')
code_str = obj.remaining_line_csv
obj.new_method(method_name, code_str)
puts obj.call(method_name)
