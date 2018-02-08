# The program adds numbers with both add and +
# The program subtracts numbers with both subtract and -
# The program adds numbers with both multiply and *
# The program adds numbers with both divide and /
# The program handles divide when attempting to divide by zero.
# The program handles erroneous input. For example the user might enter clown when asked to enter a number.
# The program also needs to handle erroneous operators.



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
  return num1 / num2
end

puts "Hello! Welcome to my Calculator App!"
puts
puts "Please enter a number!"
begin
  num1 = gets.chomp.to_f
  num1 = Integer(num1)
rescue
  puts "Please enter a numeric value!"
  retry
end

puts "Please enter an operator!"
operator = gets.chomp
until
  ["add", "+", "subtract", "-", "divide", "/", "multiply", "*"].include?(operator)
  puts "Please enter a valid operator!"
  operator = gets.chomp
end

puts "Please enter another number!"
begin
  num2 = gets.chomp.to_f
  num2 = Integer(num2)
rescue
  puts "Please enter a numeric value!"
  retry
end

case operator
when "add", "+"
  puts add(num1, num2)
when "subtract", "-"
  puts subtract(num1, num2)
when "multiply", "*"
  puts multiply(num1, num2)
when "divide", "/"
  if num2 == 0
    puts "Cannot divide by 0"
  else
    puts divide(num1, num2)
  end
end
