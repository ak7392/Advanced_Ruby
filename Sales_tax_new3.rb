require 'stringio'

class Product
  attr_accessor :name, :imported, :sales_tax, :price

  def initialize(**kwargs)
    @name = kwargs[:name]
    @imported = kwargs[:imported] # true or false
    @sales_tax = kwargs[:sales_tax]  # true or false
    @price = kwargs[:price]
  end

  def calculated_sales_tax(base)
    sales_tax ? price * base : 0
  end

  def calculated_import_duty(duty)
    imported ? price * duty : 0
  end

  def with_tax(base, duty)
    price + calculated_sales_tax(base) + calculated_import_duty(duty)
  end

  def to_s
    "#{name} -> #{price}"
  end
end

class TaxCalculator

  attr_reader :products

  BASE_TAX = 0.1
  IMPORT_DUTY = 0.05

  def initialize(*products)
    @products = products
  end

  def grand_total
    products.inject(0) { |total, product| total += product.with_tax(BASE_TAX, IMPORT_DUTY) }
  end

end

# Tested!
class Prompt
  def self.for(question)
    print question
    gets.chomp.strip
  end

  def self.for_yes_no_question(question, correct_value)
    print question
    val = gets.chomp.strip
    val.eql?(correct_value)
  end
end

class Billing
  attr_accessor :product_list

  def initialize
    @product_list = []
  end

  # Tested!
  # Throws an error if price is not convertable to integer
  # Order name(string), imported flag(boolean), salex tax flag(boolean), price(integer)
  def question_set
    [
      Prompt.for('Name of product: '),
      Prompt.for_yes_no_question('Imported?: ', 'yes'),
      Prompt.for_yes_no_question('Exempted from sales tax? ', 'yes'),
      Integer(Prompt.for('Price: '))
    ]
  end

  # Tested!
  def user_input_loop
    keys = [:name, :imported, :sales_tax, :price]
    loop do
      product = Product.new(Hash[keys.zip(question_set)])
      product_list << product
      break unless Prompt.for_yes_no_question('Do you want to add more items to your list(y/n): ','y')
    end
  end

  def to_s
    tax = TaxCalculator.new(*product_list)
    total = tax.grand_total.ceil
    result = StringIO.new('', 'w')
    result.puts product_list
    result.puts "Grand Total -> #{total}"
    result.string
  end
end

begin
  billing = Billing.new
  billing.user_input_loop
  puts billing
rescue => e
  puts e.message
end
