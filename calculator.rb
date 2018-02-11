# Calculator Project
puts "Welcome to the Best Calculator ever! It can help you evaluate addition,
  subtraction, multiplication and division equations."

# addition
def add(num1, num2)
  return num1 + num2
end

 #subtraction
def sub(num1, num2)
  return num1 - num2
end

#multiplication
def mul(num1, num2)
  return num1 * num2
end

#division
def div(num1, num2)
  return num1 / num2
end


# Ask user for Data
# Operation
# two numbers
# validate the data type from user

puts "\nEnter the first number."
num1 = gets.chomp
until num1 =~ /\d/
    print 'Invalid number. Enter a valid number: '
    num1 = gets.chomp
  end

puts "\nChoose an Operation"
operation = gets.chomp

puts "\nEnter the second number."
num2 = gets.chomp
until num2 =~ /\d/
    print 'Invalid number. Enter a valid number: '
    num2 = gets.chomp
  end

num1 = num1.to_i
num2 = num2.to_i


# handle the input from user

case operation
  when "add", "+"
    puts add(num1,num2)
  when "subtract", "-"
    puts sub(num1,num2)
  when "multiply", "*"
    puts mul(num1,num2)
  when "divide", "/"
    puts div(num1,num2)
  else
    print "I am not quite sure what you want to do!"
end
