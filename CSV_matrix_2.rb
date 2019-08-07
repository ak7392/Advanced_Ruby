require 'csv'

class ReadCsv

  def initialize(source_name)

    @klass = Class.new
    class_name = File.basename(source_name, ".csv").capitalize
    Object.const_set(class_name, @klass)

    arr = CSV.read(source_name).transpose
    @klass_obj = @klass.new
    arr.each { |method_name, *a| @klass_obj.define_singleton_method(method_name.to_s) { a } }

  end

  def call(method_name)
    @klass_obj.send(method_name)
  end

end

k = ReadCsv.new('Input.csv')
p k.call 'name'
p k.call 'age'
p k.call 'city'
