def calculate_answer(a, operator, b)

  if operator == ":+"
    return result= a.to_i  + b.to_i
  elsif operator == ":-"
    return result = a.to_i - b.to_i
  elsif operator == ":*"
    return result = a.to_i * b.to_i
  elsif operator == ":/"
    return result = a.to_i / b.to_i
  end

end

a, operator, b = ARGV[0].split(',')
puts calculate_answer(a, operator, b)
