# Maria I Velez
# 6 - 7 Feb 2018
# Calculator Exercise, details here: https://github.com/Ada-C9/calculator

# Show the METHODS

# addition
def addition(num1, num2)
  return num1 + num2
end
user_addition = addition(num1, num2)
puts "This is the sum: #{user_addition}"

# subtraction
def subtraction(num1, num2)
  return num1 - num2
end
user_subtraction = subtraction(num1, num2)
puts "This is the subtraction: #{user_subtraction}"

# multiplication
def multiplication(num1, num2)
  return num1 * num2
end
user_multiplication = multiplication(num1, num2)
puts "This is the multiplication: #{user_multiplication}"

# division
def division(num1, num2)
  if num2 == 0
    puts "Please enter a number other than zero: "
  else
  return num1 / num2
  end
end
user_division = division(num1, num2)
puts "This is the division: #{user_division}"

# statements to handle 'user_operation' entries
case user_operation
  when "add", "+"
    puts "Okay, we're adding numbers."
  when "subtract", "-"
    puts "Okay, we're subtracting numbers"
  when "multiply", "*"
    puts "Okay, we're multiplying numbers"
  when "divide", "/"
    puts "Okay, we're dividing numbers"
  else
    puts "I have no idea what to put here..."
end

# ask user for input
puts "Enter the operation you'd like to perform (a string or numeric symbol): "
user_operation = gets.chomp

puts "Please enter the first number: "
num1 = gets.chomp

puts "Please enter the second number: "
num2 = gets.chomp
