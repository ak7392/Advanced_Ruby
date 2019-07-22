# Method for creation of shopping List
def create_list
  print "What is the list name? "
  name = gets.chomp

  hash = { "name" => name, "items" => Array.new }
  return hash
end

# ADD ITEMS
def add_list_item
  print "What is the item you'd like to add? "
  item_name = gets.chomp

  print "How much/many? "
  quantity = gets.chomp.to_i

  hash = { "name" => item_name, "quantity" => quantity }
  return hash
end

# PRINT SEPARATOR
def print_separator(character="-")
  puts character * 80
end

# Display List
def display_list(list)
  puts "List: #{list['name']}"
  print_separator()
  list["items"].each do |item|
    puts "\tItem: " + item['name'] + "\t\t\t" +
         "Quantity: " +item["quantity"].to_s
  end
  print_separator()
end

list = create_list()
puts "Now, let's add items to your list!"

x = "yes"

while x == "yes" do
  list["items"].push(add_list_item)
  puts "Would you like to add another item to the list? (enter 'yes' or 'no')"
  x = gets.chomp.downcase
end

puts "Here's your list:\n"
display_list(list)
