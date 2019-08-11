require 'csv'

class ReadCsv
  def self.read(file_name)
    class_name = File.basename(file_name, ".csv").capitalize
    rows = CSV.read(file_name)
    the_class = Struct.new(*rows.shift.map(&:to_sym))
    Object.const_set(class_name, the_class)
    rows.map { |row| the_class.new(*row) }
  end
end

array = ReadCsv.read('Input.csv')
first_row = array[0]
p first_row
p first_row.name
p first_row.name = 'XYZ'
p first_row.age = 25
second_row = array[1]
p second_row
p second_row.name
p second_row.name = 'Abhinav_Kannojia'
p second_row.age = 26
