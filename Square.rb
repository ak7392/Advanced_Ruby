class Array

  def string_to_array!(string)
    string.scan(/\d+/).map(&:to_i)
  end

  def power!(v2)
    # arr = self.split(",").map {|s| s.to_i}
    # index = self.length - 1
    # while index > -1 do
    #   yield (self[index].split(",").map {|s| s.to_i} ** v2.to_i)
    #   index -= 1
    # end
    return self.map! { |x| x ** v2.to_i }
  end
end

a = Array.new
# begin
v1 = ARGV[0].to_s
v2 = ARGV[1]
v3 = a.string_to_array!(v1)
if v3.any?
  print v3.power!(v2)
else
  puts "Please provide input"
end
