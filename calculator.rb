# Intro for user
puts "\nI'm a calculator.\n\nI can add, subtract, multiply and divide."

# Method to determine whether input is numeric
def numeric(num)
  if num =~ /[-+]?([0-9]*\.[0-9]+|[0-9]+)/
    return true
  else
    return false
  end
end

# User prompted to enter first number
print "\nGive me a number: "
num1 = gets.chomp

# User gets message to enter number again if it is not numerical
until numeric(num1)
  print "\nThat's not a number! Try again: "
  num1 = gets.chomp
end

# numbers are converted to either integers or floats
if num1 =~ /\A\d+\z/
  num1 = num1.to_i
else
  num1 = num1.to_f
end

# List of acceptable operations
operations = ["add", "+", "subtract", "-", "multiply", "*", "divide", "/"]

# Prompt user to enter operation
print "Enter an operation: "
operation = gets.chomp.downcase

# User prompted to enter valid operation if they enter something not acceptable.
until operations.include? operation
  print "\nTry again! Enter valid operation (+,-,*,/): "
  operation = gets.chomp
end

# Enter Number 2
print "Give me another number: "
num2 = gets.chomp

until numeric(num2)
  print "\nThat's not a number! Try again: "
  num2 = gets.chomp
end

if num2 =~ /\A\d+\z/
  num2 = num2.to_i
else
  num2 = num2.to_f
end

if operation == "divide" || operation == "/"
  until num2 != 0.0
    print "Error: Division by zero is undefined. Try another number: "
    num2 = gets.chomp
    until numeric(num2)
      print "That's not a number! Try again: "
      num2 = gets.chomp
    end
    if num2 =~ /\A\d+\z/
      num2 = num2.to_i
    else
      num2 = num2.to_f
    end
  end
end

# create methods for each operation
def add(num_one, num_two)
  return num_one + num_two
end

def subtract(num_one, num_two)
  return num_one - num_two
end

def multiply(num_one, num_two)
  return num_one * num_two
end

def divide(num_one, num_two)
  return num_one / num_two
end

# the result value will be printed based on operation user input and two numbers input
if operation == "add" || operation == "+"
  puts "\n#{num1} + #{num2} = #{add(num1, num2)}"
elsif operation == "subtract" || operation == "-"
  puts "\n#{num1} - #{num2} = #{subtract(num1, num2)}"
elsif operation == "multiply" || operation == "*"
  puts "\n#{num1} * #{num2} = #{multiply(num1, num2)}"
elsif operation == "divide" || operation == "/"
  puts "\n#{num1} / #{num2} = #{divide(num1, num2)}"
else
  puts "error"
end
