# Define methods for each mathematical operation
# Methods will perform operation and return string showing full equation
def add(num1, num2)
  solution = (num1 + num2)
end

def subtract(num1, num2)
  solution = (num1 - num2)
end

def multiply(num1, num2)
  solution = (num1 * num2)
end

def divide(num1, num2)
    solution = (num1/num2)
  end

# define hash full of mathematical operation options
math_functions = ["add", "+", "subtract", "-", "multiply", "*", "divide", "/"]

# Greeting
puts "We're going to do some addition, subtraction, multiplication
or division - it'll be like a choose your own adventure, math style!"

# Gets user input for mathematical equation
puts "What number would you like to operate on?"
num1 = gets.chomp

# Checks to ensure user input is either float or integer, if not requires new input
until num1.match(/^\d*\.?\d+$/) && !num1.empty?
  puts "Oops! That's not a valid number - please enter a number."
  num1 = gets.chomp
end

# If string only contains digits, converts to integer, otherwise converts to float
if num1.match(/^\d+$/)
  num1 = num1.to_i
else
  num1 = num1.to_f
end


puts "What mathematical operation would you like to use?"
operation = gets.chomp

# ensures only responses that match the available math operations are accepted
until math_functions.include? (operation)
  puts "Oops! That's not an operation I can process. Try +, subtract, mulitply, /, etc."
  operation = gets.chomp
end

puts "What is the last number you would like to use?"
num2 = gets.chomp
until num2.match(/^\d*\.?\d+$/) && !num2.empty?
  puts "Oops! That's not a number - please enter a number."
  num2 = gets.chomp
end

if num2.match(/^\d+$/)
  num2 = num2.to_i
else
  num2 = num2.to_f
end

# Check to ensure that mathematical equation will not throw error code and loop until num2 isn't combined with divide or /
until !(num2 == 0 && operation == ("/" || "divide"))
  puts "Uh-oh! You can't divide by 0! Please enter a new second number."
  num2 = gets.chomp.to_f
end

# Call methods above based upon user input
solution = nil
case operation
when "add", "+"
  solution = add(num1, num2)
when "subtract", "-"
  solution = subtract(num1, num2)
when "multiply", "*"
  solution = multiply(num1, num2)
when "divide", "/"
  solution = divide(num1, num2)
end
# Converts string version of operator to sybmolic version for easier printing.
if solution == "add"
  solution = "+"
elsif solution == "subtract"
  solution = "-"
elsif solution == "multiply"
  solution = "*"
else
  solution == "/"
end

# prints out formula used to calculate result
puts "#{num1} #{operation} #{num2} = #{solution}"
