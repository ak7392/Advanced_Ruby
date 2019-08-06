# Sales Tax Problem
class FormatDisplay
  def initialize(data_array)
    @data_array = data_array
    @max_length_fields = {}
    @column_width = 0
    @data_array[0].each { |field| @max_length_fields[field] = field.length}
  end

  def display_table
    @data_array.each do |fieldset|
      row_string = ''
      fieldset.each_with_index do |field, i|
        row_string += '| ' + sprintf("%#{@max_length_fields[@data_array[0][i]]}s", field) + " "
      end
      puts row_string
    end
  end
end

class Item
  attr_reader :name, :imported, :exempted, :price
  attr_accessor :price_including_tax

  def initialize(name, imported, exempted, price, items)
    @name = name
    @imported = imported
    @exempted = exempted
    @price = price.to_f
    @price_including_tax = @price
    @item_list = items
  end

  def calculate_effective_price
    @price_including_tax *= 1 + @@sales_tax/100.to_f if @exempted =~ /no/i
    @price_including_tax *= 1 + @@import_duty/100.to_f if @imported =~ /yes/i
    @price_including_tax = @price_including_tax.round(2)
  end
end

# Invoice Class
class Invoice
  @@import_duty = 5
  @@sales_tax = 10
  attr_accessor :grand_total, :name, :imported, :exempted, :price

  def initialize(item, items)
    @name_inv = item.name
    @instance_of_class_item = Item.new(name, imported, exempted, price, items)
    @grand_total = 0
    @item_list = items
  end

  def method_calls_method
    @instance_of_class_item.calculate_effective_price
  end

  def calculate_grand_total
    @item_list.each { |item| self.grand_total += item.price_including_tax }
  end
  def create_data_array
    data_array = []
    data_array.push(["name", "imported", "exempted", "price", "price including tax"])
    @item_list.each do |item|
      data_array.push([item.name, item.imported, item.exempted, item.price, item.price_including_tax])
    end
    data_array
  end
  def generate_bill()
    @item_list.each do |item|
      method_calls_method
    end
    calculate_grand_total
    format = FormatDisplay.new(create_data_array)
    format.display_table
  end
end


items = []
begin
  print "\nName of the product: "
  name = gets.chomp
  print "Imported?: "
  imported = gets.chomp
  print "Exempted from sales tax? "
  exempted = gets.chomp
  print "Price: "
  price = gets.chomp
  print "Do you want to add more items to your list(y/n): "
  continue_choice = gets.chomp
  raise RuntimeError, "entered price is not a number" if  price !~ /^[+-]?\d+([.]\d+)?$/
  items << Item.new(name, imported, exempted, price, items)
end while continue_choice =~ /^y$/i

item = Item.new(name, imported, exempted, price, items)
invoice = Invoice.new(item, items)
invoice.generate_bill()
