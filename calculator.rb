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
  if num2 != 0
    return num1 / num2
  else
    puts "Operation not possible. Division by zero is not allowed."
  end
end

def modulo(num1, num2)
  return num1 % num2
end

def exponify(num1, num2)
  return num1 ** num2
end

puts "Enter the operation you would like:"
operation = gets.chomp

until ["add", "+", "subtract", "-", "multiply", "*", "divide", "/", "exponify", "**", "modulo", "%"].include?(operation)
  puts "Please tell me to add (+), subtract (-), multiply (*), divide (/), exponify (**), or modulo (%)!"
  operation = gets.chomp
end

puts "Enter the first number:"
num1 = gets.chomp

#regex to check for a numeral
# lines 44-59 should be condensed into a method somehow
while num1 !~ /^-?[0-9]+$/
  puts "Please enter a valid number:"
  num1 = gets.chomp
end

num1 = num1.to_f

puts "Enter the second number:"
num2 = gets.chomp

while num2 !~ /^-?[0-9]+$/
  puts "Please enter a valid number:"
  num2 = gets.chomp
end

num2 = num2.to_f

# case statements only accept strings (?)
case operation
  when "add", "+"
  answer = add(num1,num2)
  when "subtract", "-"
  answer = subtract(num1,num2)
  when "multiply", "*"
  answer = multiply(num1,num2)
  when "divide", "/"
  answer = divide(num1,num2)
  when "exponify", "**"
  answer = exponify(num1,num2)
  when "modulo", "%"
  answer = modulo(num1,num2)
  else
  puts "Please enter a valid operation."
end

puts "Answer: #{answer}"
