# I wanted to allow the user to enter their calculation in the same way you would in a normal calculator.
# This ended up being much more of a headache than I originally anticipated,
# particularly when dealing with negative numbers, hence this rather unweildy parsing method.
# This method parses the user's input string and returns an array where the 1st element is the 1st number in the operation,
# the 2nd element is the operator, and the 3rd element is the 2nd number in the operation.
def parse(input)
  # Removes white space, converts string into an array split by the possible operators (but retaining the operators).
  # Removes empty strings from the array. I'm actually not sure where these are coming from, but I noticed them when the user enters a negative number.
  parsed_input = input.gsub(/\s+/,"").split(/(\+)|(-)|(\*)|(\/)|(\^)|(%)|(add)|(subtract)|(multiply)|(divide)|(exponent)|(modulo)/).reject { |x| x.empty? }
  # If the first element of the array is a negative sign,
  # reassigns the 2nd element as a joined string of the sign and existing number in the 2nd element,
  # and deletes the 1st element.
  if parsed_input[0] == "-"
    parsed_input[1] = parsed_input[0..1].join
    parsed_input.slice!(0)
  end
  # If the 3rd element of the array is a negative sign,
  # reassigns the 4th element as a joined string of the sign and existing number in the 4th element,
  # and deletes the 3rd element.
  if parsed_input[2] == "-"
    parsed_input[3] = parsed_input[2..3].join
    parsed_input.slice!(2)
  end
return parsed_input
end

# This method checks a few characteristics of the parsed array
# including the length of the array (which should be = 3 after parsing),
# and the format of the 1st and 3rd elements of the array, which should be numeric.
def validation(parsed_array)
  if parsed_array.length > 3
    puts "Sorry, this calculator can't handle operations that complex."
    # If the array length is greater than 3, the user likely entered more than one operator. Returns nil.
  elsif parsed_array.length < 3
    puts "Hmm. It doesn't look like the operation you've entered is valid for this calculator."
    # If the array length is less than 3, the user likely didn't enter enough information,
    # or didn't enter it in a manner that the parser could handle. Returns nil.
  elsif (parsed_array[0] =~ /^[-+]?\d+(\.\d+)?$/).nil? || (parsed_array[2] =~ /^[-+]?\d+(\.\d+)?$/).nil?
    puts "Hmm. It doesn't look like the operation you've entered is valid for this calculator."
    # This checks if the 1st and 3rd elements of the array match a regex that
    # permits an optional +/- sign at the start of string, digits 0-9, and optional digits 0-9 after the decimal point.
    # Returns nil.
  else
    return parsed_array
    # If none of the above applies, returns the parsed array unmodified.
  end
end

# This method checks if the number argument (in string format) includes a decimal point.
# Returns the string as a float if it includes a decimal point and an integer if it does not.
def integer_or_float(x)
  if x.include?(".")
    return x.to_f
  else
    return x.to_i
  end
end

# Addition method
def add(x, y)
  return x + y
end

# Subtraction method
def subtract(x, y)
  return x - y
end

# Multiplication method
def multiply(x, y)
  return x * y
end

# Division method. If the divisor is 0, returns string notifiying user of their error.
# If both arguments are integers and not divisible, converts the dividend to a float and returns the result of the float calculation.
# Otherwise, returns the result of the integer or float calculation, depending on the data types of the arguments.
def divide(x, y)
  if y == 0
    return "Psst. You can't divide by zero. Please try again."
  elsif x.is_a?(Integer) && y.is_a?(Integer) && x % y != 0
    return x.to_f / y
  else
    return x / y
  end
end

# Exponent method
def exponent(x, y)
  return x ** y
end

# Modulo method. If the 2nd argument is 0, returns string notifying user of their error.
def modulo(x, y)
  if y == 0
    return "Psst. You can't divide by zero. Please try again."
  else
    return x % y
  end
end

# Informs user of the limits of the calculator, the possible operators, and prompts user for their calculation.
puts "Welcome to my (very limited) calculator. This calculator can perform basic arithmetic operations between two numbers."
puts "\nThe accepted operators are: +, -, *, /, ^, or %, or the words add, subtract, multiply, divide, exponent, or modulo."
print "\nPlease enter your operation: "

# Stores user input as a string with downcase characters.
operation = gets.chomp.downcase

# Checks if user has entered nothing and prompts user to enter their calculation again.
while operation == ""
  print "Hmm. It doesn't look like you entered anything. Please try again: "
  operation = gets.chomp.downcase
end

# Passes user input string as an argument to the parse method.
op_array = parse(operation)

# Passes parsed array as an argument to the validation method.
# If validation method returns nil, prompts user to try their calculation again.
# Otherwise, assigns the 3 elements of the parsed array to variables.
# Case statement uses the operators as conditions, passes the two numbers to the various arthimetic methods,
# which return the result of the calculation. Else statement provides a final error message if the user
# somehow passed the validation but didn't enter a valid operator.
if validation(op_array).nil?
  puts "Please try again."
else
  num1 = integer_or_float(op_array[0])
  operator = op_array[1]
  num2 = integer_or_float(op_array[2])
  case operator
    when "add", "+"
      result = add(num1, num2)
    when "subtract", "-"
      result = subtract(num1, num2)
    when "multiply", "*"
      result = multiply(num1, num2)
    when "divide", "/"
      result = divide(num1, num2)
    when "exponent", "^"
      result = exponent(num1, num2)
    when "modulo", "%"
      result = modulo(num1, num2)
    else
      result = "not a valid operation"
  end
  puts "\n#{op_array.join(" ")} = #{result}"
  # Prints the user input and result.
end
