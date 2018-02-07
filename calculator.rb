# Baseline
# The program should ask the user for an operation (string or numeric symbol) and two numbers.

# Primary Requirements
# The program should use the input operation and two numbers to provide the result of applying the operation to the two numbers.
# The program should have support for these four operations: addition, subtraction, multiplication, and division.
# The program should accept both the name (`add`) and the symbol (`+`) for each possible operation.

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

puts "Welcome to Calculator!"
puts "I'm going to ask you for two numbers, and an operator. What is your first number?: "
num_1 = gets.chomp

puts num_1.Class

until num_1.is_a?(Integer)
  puts "Invalid input. Try again: "
  num_1 = gets.chomp
end

puts "Great! What is your second number? (Must be greater than zero)"
num_2 = gets.chomp

until (num_2 > 0) && (num_2.is_a? Integer)
  print "Invalid input. Try again: "
  num_2 = gets.chomp
end

puts "Awesome. Now, what would you like to do to these numbers? You can type add (+), subtract (-), multiply (*), or divide (/)"
operator = gets.chomp

case operator
when "add", "+"
  puts addition(num_1, num_2)
when "subtract", "-"
  puts subtraction(num_1, num_2)
when "multiply", "*"
  puts multiplication(num_1, num_2)
when "divide", "/"
  puts division(num_1, num_2)
end


# puts num_1
# puts num_2
# puts operator

# def calculate(x, y)
#
#   case operator
#   when "add" || "+"
#     result = x + y
#     return "The total of your numbers added together is: #{result}."
#   when "subtract" || "-"
#     result = x - y
#     return "The total of your second number subtracted from your first number is: #{result}."
#   when "multiply" || "*"
#     result = x * y
#     return "The total of your numbers multiplied together is: #{result}."
#   when "divide" || "/"
#     result = x / y
#     return "The total of your first number divided by your second number is: #{result}."
#   end
# end

# puts calculate (num_1, num_2)
