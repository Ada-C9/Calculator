# Baseline
# The program should ask the user for an operation (string or numeric symbol) and two numbers.

# Primary Requirements
# The program should use the input operation and two numbers to provide the result of applying the operation to the two numbers.
# The program should have support for these four operations: addition, subtraction, multiplication, and division.
# The program should accept both the name (`add`) and the symbol (`+`) for each possible operation.

# define methods for adding, subtracting, multiplying, and dividing
def addition(x, y)
  x + y
end

def subtraction(x, y)
  x - y
end

def multiplication(x, y)
  x * y
end

def division(x, y)
  x / y
end

# Welcome user and test for/handle erroneous input 

puts "Welcome to Calculator!"
puts "I'm going to ask you for two numbers, and an operator. What is your first number?: "
num_1 = gets.chomp

until num_1 =~ /\d/
  puts "That's not a number, try again: "
  num_1 = gets.chomp
end

puts "Great! What is your second number? (Must be greater than zero)"
num_2 = gets.chomp

until (num_2 =~ /\d/)
  puts "That's not a number. Try again: "
  num_2 = gets.chomp
end

if num_2.to_i <= 0
  puts "Number must be greater than zero, try again: "
  num_2 = gets.chomp
end

puts "Awesome. Now, what would you like to do to these numbers? You can type add (+), subtract (-), multiply (*), or divide (/)"
operator = gets.chomp

# Case statement that tests the value of the operator variable
# The program also needs to handle erroneous operators.

loop do
  case operator
  when "add", "+"
    puts addition(num_1.to_f, num_2.to_f)
  when "subtract", "-"
    puts subtraction(num_1.to_f, num_2.to_f)
  when "multiply", "*"
    puts multiplication(num_1.to_f, num_2.to_f)
  when "divide", "/"
    puts division(num_1.to_f, num_2.to_f)
    break
  else
    puts "Invalid input, try again: "
    operator = gets.chomp
  end
end
