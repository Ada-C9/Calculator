# arrays to store acceptable inputs for different user responses
good_operators = ["add", "+", "subtract", "-", "multiply", "*", "divide", "/", "**", "^", "exponents", "%", "modulo", "remainder"]
good_num_types = ["integer", "float"]

# method to make code a little more readable
def spacing
  puts "------------------------------------------"
end

# method to check user input for specific strings that determine how numbers are evaluated
def input_check input_type, input
  until input_type.include?(input) do
    puts "I'm sorry. I'm unfamiliar with that."
    puts "Please try again from one of the options listed above."
    input = gets.chomp.downcase
    spacing
  end
  return input
end

# method to convert number inputs into float or integer
def float_or_integer type
  num_input = nil
  if type == "integer"
    num_input = Integer (Float gets.chomp rescue nil)
  elsif type == "float"
    num_input = Float gets.chomp rescue nil
  end
end

# method to check user number input to confirm they gave a valid entry
def num_check num, number_type
  until num.class == Integer || num.class == Float
    puts "I'm sorry that doesn't seem to be a number."
    puts "Do you have some else in mind?"
    num = float_or_integer(number_type)
    spacing
  end
  return num
end

# program introduction
puts "Hello! Welcome to this basic calculator."
spacing # for aesthetic purposes, they are scattered throughout

# giving user the options
puts "With any two numbers, you can do some arithmetic here, such as:"
puts "+ (or add), - (or subtract), * (or multiply), / (or divide),"
puts "^ or ** (or exponents), and % (or modulo)"
spacing

# starting to prompt user for inputs
puts "are you planning to use an integer or a float?"
num_type = gets.chomp.downcase # 1. integer or float?
spacing

# invoking method to check number type input
num_type = input_check good_num_types, num_type


# prompt for input 2
puts "what operation would you like to do?"
operator = gets.chomp.downcase # 2. what math are we doing?
spacing
# invoking check for operation availibility
operator = input_check good_operators, operator

# getting first number
puts "what is the first number?"
num_1 = float_or_integer num_type
spacing
# invoking number check 1
num_1 = num_check num_1, num_type

# getting second number
puts "what is the second number?"
num_2 = float_or_integer num_type
spacing
# same as above, number check 2
num_2 = num_check num_2, num_type


# conditional to do the maths
if operator == "add" || operator == "+"
  answer = num_1 + num_2
  puts "#{num_1} + #{num_2} = #{answer}"
elsif operator == "subtract" || operator == "-"
  answer = num_1 - num_2
  puts "#{num_1} - #{num_2} = #{answer}"
elsif operator == "multiply" || operator == "*"
  answer = num_1 * num_2
  puts "#{num_1} * #{num_2} = #{answer}"
elsif num_2 != 0 && (operator == "divide" || operator == "/")
  answer = num_1 / num_2
  puts "#{num_1} / #{num_2} = #{answer}"
  # first divide case to exclude dividing by 0
elsif num_2 == 0 && (operator == "divide" || operator == "/")
  puts "I'm sorry. We can't divide by 0."
  puts "#{num_1} / #{num_2} = undefined."
  # second divide case to deal with division by 0
elsif operator == "**" || operator == "^" || operator == "exponents"
  answer = num_1 ** num_2
  puts "#{num_1} ^ #{num_2} = #{answer}"
elsif operator == "%" || operator == "modulo"
  answer = num_1 % num_2
  puts "#{num_1} % #{num_2} = #{answer}"
end
