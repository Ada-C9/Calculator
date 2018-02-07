##### START INITIAL HASHES #####

# store operation, num_1, and num_2 after entry by user
# important note - sometimes num_1 and num_2 are stored with revised formatting, but sometimes they are not
user_input = {}

# list all valid operations that can be requested by the user
valid_operators = {:+ =>["add", "addition", "+"], :- =>["subtract", "subtraction", "-"], :* =>["multiply", "multiplication", "*", "x", "X"], :/ =>["divide", "division", "/"]}

# wip: valid operations for exponential functions and modular functions
# :** =>["exponent", "exponents", "^", "**"], :% =>["modulo", "modular function", "modularfunction", "%"]

##### END INITIAL HASHES #####

##### START FUNCTIONS #####

# perform addition
def addition(num_1, num_2)
  num_1 + num_2
  return num_1 + num_2
end

# perform subtraction
def subtraction(num_1, num_2)
    num_1 - num_2
    return num_1 - num_2
end

# perform multiplication
def multiplication(num_1, num_2)
  num_1 * num_2
  return num_1 * num_2
end

# perform division
def division(num_1, num_2)
  num_1 / num_2
  return num_1 / num_2
end

# wip: perform exponential function; not implemented in program
def exponential_function
  num_1 ** num_2
  return num_1 ** num_2
end

# wip: perform modular function; not implemented in program
def modular_function
  num_1 % num_2
  return num_1 % num_2
end

# request operation, num_1, and num_2 from user then store in hash
def request_operations_numbers(user_input, valid_operators)
  puts "What operation would you like to perform?"
  operation = gets.chomp
  if valid_operators.values.flatten.include?(operation)
    user_input[:operation] = operation
  else
    puts "Whoa nelly! You don't make sense. You can add, subtract, multiply, or divide."
    exit
  end
  puts "What's the first number you would like to use?"
  num_1 = gets.chomp
  user_input[:num_1] = num_1

  puts "What's the second number you would like to use?"
  num_2 = gets.chomp
  user_input[:num_2] = num_2
end

# check is user is asking to divide by 0 then provide error message
# return false if user asks to divide by zero, elsewise return true
def divide_by_zero(num_2)
  if num_2 == 0 || num_2 == 0.0
    puts "Sorry, dividing by zero is invalid."
    return false
  else
    return true
  end
end

# format user input for division, function is not used with addition, subtraction, or multiplication
# division is the only operation that may result in a float even if both num_1 and num_2 are integers
# it results in a float when the result is a fraction which occurs only when num_1 is not evenly divisible by num_2
# this can be restated as the result is a fraction whenever the modulo of num_1 and num_2 does not equal 0
# all together, if division is the operation and num_1 and num_2 are both integers and modulo does not equal 0, the result must be a float
# if any of these three condition isn't met, then num_1 and num_2 can be formatted as they are with the other operations
# must check if dividing by zero is a problem after determining that both are integers, but before calculating modulo
# this is bc modulo can't be calculated if num_2 is zero as it will make the program throw an error message
# format_userinput_for_division formats the numbers, performs the calculation, and returns the calculation
# format_userinput_not_including_division formats the numbers, but doesn't perform the calculation
def format_userinput_for_division(operator, valid_operators, num_1, num_2, user_input)
  if num_1 =~ /^(\d)+$/ && num_2 =~ /^(\d)+$/
    unless divide_by_zero(num_2.to_i)
      exit
    end
    modulo = (num_1.to_i % num_2.to_i)
    if modulo != 0
      result = (num_1.to_f / num_2.to_f)
      return result
    else
      format_userinput_not_including_division(valid_operators, num_1, num_2, user_input)
      result = division(user_input[:num_1], user_input[:num_2])
      return result
    end
  else
    format_userinput_not_including_division(valid_operators, num_1, num_2, user_input)
    result = division(user_input[:num_1], user_input[:num_2])
    return result
  end
end

# format user input for addition, subtration, and multiplication, but not for division
# only formats the numbers, does not perform the actual calculation
def format_userinput_not_including_division(valid_operators, num_1, num_2, user_input)
  if num_1 =~ /^(\d)*\.(\d)+$/
    num_1 = num_1.to_f
    user_input[:num_1] = num_1
  elsif num_1 =~ /^(\d)+$/
    num_1 = num_1.to_i
    user_input[:num_1] = num_1
  else
    puts "Whoa nelly! It looks like you entered something other than a number."
    exit
  end
  if num_2 =~ /^(\d)*\.(\d)+$/
    num_2 = num_2.to_f
    user_input[:num_2] = num_2
  elsif num_2 =~ /^(\d)+$/
    num_2 = num_2.to_i
    user_input[:num_2] = num_2
  else
    puts "Whoa nelly! It looks like you entered something other than a number."
    exit
  end
end

# if the result of a calculation is zero, display 0 never 0.0
def format_if_result_is_zero(result)
  if result == 0 || result == 0.0
    result = 0
  end
  return result
end

##### END FUNCTIONS #####

##### START BODY #####

# display welcome message
puts "Welcome to The Handy Dandy Calculator!\n\n"

# request operation, num_1, and num_2 from the user
request_operations_numbers(user_input, valid_operators)

# if performing addition, format the user input, perform the calculation, format result if it's zero, display equation and final result
if valid_operators[:+].include?(user_input[:operation])
  format_userinput_not_including_division(valid_operators, user_input[:num_1], user_input[:num_2], user_input)
  result = addition(user_input[:num_1], user_input[:num_2])
  result = format_if_result_is_zero(result)
  puts "#{user_input[:num_1]} + #{user_input[:num_2]} = #{result}"

# if performing subtraction, format the user input, perform the calculation, format result if it's zero, display equation and final result
elsif valid_operators[:-].include?(user_input[:operation])
  format_userinput_not_including_division(valid_operators, user_input[:num_1], user_input[:num_2], user_input)
  result = subtraction(user_input[:num_1], user_input[:num_2])
  result = format_if_result_is_zero(result)
  puts "#{user_input[:num_1]} - #{user_input[:num_2]} = #{result}"

# if performing multiplication, format the user input, perform the calculation, format result if it's zero, display equation and final result
elsif valid_operators[:*].include?(user_input[:operation])
  format_userinput_not_including_division(valid_operators, user_input[:num_1], user_input[:num_2], user_input)
  result = multiplication(user_input[:num_1], user_input[:num_2])
  result = format_if_result_is_zero(result)
  puts "#{user_input[:num_1]} x #{user_input[:num_2]} = #{result}"

# if performing division, format the user input and perform the calculation in one function
# after that, format result if it's zero then display equation and final result
elsif valid_operators[:/].include?(user_input[:operation])
  result = format_userinput_for_division(user_input[:operator], valid_operators, user_input[:num_1], user_input[:num_2], user_input)
  result = format_if_result_is_zero(result)
  puts "#{user_input[:num_1]} / #{user_input[:num_2]} = #{result}"
end

#### END BODY #####
