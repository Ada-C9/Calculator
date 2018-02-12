# If number is integer, calculate with integer. If number has decimal, calculate with floats

# If division has no remainder, print integer, otherwise print float
# p calculate_division

# p calculate_exponential
# first_number = []
# second_number = []

calculator_options = %w[add + subtract - multiply * divide / exponent **]

# calculator_options = ["add", "+", "subtract", "-", "multiply", "*", "divide", "/", "exponent", "**"]
def addition(num_one, num_two)
  return num_one + num_two
end

def subtraction(num_one, num_two)
  return num_one - num_two
end

def multiplication(num_one, num_two)
  return num_one * num_two
end

def division(num_one, num_two)
  return num_one / num_two
end

def exponential(num_one, num_two)
  return num_one ** num_two
end

puts ""
puts "\nWhat would you like to do?"
option = gets.chomp.downcase

until calculator_options.include?(option)
  puts "\nInvalid entry. Try again.\n"
  print "\nWhat would you like to do?"
  option = gets.chomp.downcase
end

puts "\nWhat is the first number?"
num_one = gets.chomp

puts "\nWhat is the second number?"
num_two = gets.chomp

# first_number << num_one
# second_number << num_two

puts ""
# Integer check

# while num_one.integer? && num_two.integer?

case option
  when "add", "+"
    calculate_addition_f = addition(num_one.to_f, num_two.to_f)
      p calculate_addition_f

  when "subtract", "-"
    calculate_subtraction_f = subtraction(num_one.to_f, num_two.to_f)
      p calculate_subtraction_f

  when "multiply", "*"
    calculate_multiplication_f = multiplication(num_one.to_f, num_two.to_f)
      p calculate_multiplication_f

  when "divide", "/"
    if num_two == "0"
       puts "Does Not Exist"
    else
    calculate_division_f = division(num_one.to_f, num_two.to_f)
      p calculate_division_f
    end

  when "exponent", "**"
    calculate_exponential_f = exponential(num_one.to_f, num_two.to_f)
      p calculate_exponential_f
end
# end
