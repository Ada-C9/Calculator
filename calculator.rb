# Project_Calculator_Octos_Wenjie Fang
# Thought process:
# 1. Define all methods needed
# 2. Collect user input
# 3. Use while loop to start the process of checking user's input is valid, calculating
# and asking user to continue or not.

# Create an array to hold all operators including names and symbols
operators = %w[add + subtract - multiply * divide / modulo % exponify **]

# Create methods for operations
# Return the result of the operation
def add(num1, num2)
  return num1 + num2
end

def subtract(num1, num2)
  return num1 - num2
end

def multiply(num1, num2)
  return num1 * num2
end

def divide(num1, num2)
  if num2 == 0
    print "Dinominator cannot be zero."
    return
  else
    return num1 / num2
  end
end

def exponify(num1, num2)
  return num1 ** num2
end

def mod(num1, num2)
  if num1 < 0 || num2 <= 0
    puts "The fisrt number should be greater than or equal to zero."
    puts "The second number should be greater than zero."
  elsif !is_integer?(num1) || !is_integer?(num2)
    puts "Both numbers should be integers"
  end
  return num1 % num2
end

# Create a method to check if user's input is an integer
# return true if it is an integer
def is_integer?(input)
  input.to_i.to_s == input
end
# Create a method to check if user's input is a float
# return true if it is an float
def is_float?(input)
  input.to_f.to_s == input
end

# Create a method to calculate when operator num1 and num2 are ready
def calculate(operator, num1, num2)
  # Use case when to invoke each method
  case operator
  when "add", "+"
    puts "#{num1} + #{num2} = #{add(num1, num2)}"
    # Do I need a return here
  when "subtract", "-"
    puts "#{num1} - #{num2} = #{subtract(num1, num2)}"
  when "multiply", "*"
    puts "#{num1} * #{num2} = #{multiply(num1, num2)}"
  when "divide", "/"
    puts "#{num1} / #{num2} = #{divide(num1, num2)}"
  when "modulo", "%"
    puts "#{num1} % #{num2} = #{mod(num1, num2)}"
  when "exponify", "**"
    puts "#{num1}^#{num2} = #{exponify(num1, num2)}"
  end
end

# Collect operator from users
puts "Welcome to Ada Calculator! Here you can practice how to:
1. add(+)
2. substract(-)
3. multiply(*)
4. divide(/)
5. modulo(%)
6. exponify(**)"

# Set a flag to start the while loop
keep_going = "yes"
while keep_going == "yes"
  puts "Please choose one operator(name or symbol):"
  operator = gets.chomp.downcase
  until operators.include?(operator)
    puts "Oops! Please choose an operator from the list(name or symbol):
    1. add(+)
    2. substract(-)
    3. multiply(*)
    4. divide(/)
    5. modulo(%)
    6. exponify(**)"
    operator = gets.chomp.downcase
  end
  
  # Collect the first number from user
  puts "Now it's time to enter two numbers:"
  print "First number: "
  num1 = gets.chomp
  until is_integer?(num1) || is_float?(num1)
    puts "Oops! Please enter a number:"
    num1 = gets.chomp
  end
  # Convert the first number to Integer or Float
  if is_integer?(num1)
    num1 = num1.to_i
  else
    num1 = num1.to_f
  end
  
  # Collect the second number from user
  print "Second number: "
  num2 = gets.chomp
  until is_integer?(num2) || is_float?(num2)
    puts "Oops! Please enter a number:"
    num2 = gets.chomp
  end
  # Convert the second number to Integer or Float
  if is_integer?(num2)
    num2 = num2.to_i
  else
    num2 = num2.to_f
  end
  
  # Invoke method calculate to compute
  calculate(operator, num1, num2)
  # Ask user if they want to continue to practice
  puts "Would you like to continue practicing? Yes/No"
  keep_going = gets.chomp.downcase
  if keep_going != "yes"
    puts "Thanks for practicing with Ada Calculator! See you soon~"
  end
end
