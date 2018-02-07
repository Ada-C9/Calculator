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

#Ask user for Data
# Operation
# two numbers
# validate the data type from user
puts "\nEnter the first number."
def num
  num = gets.chomp
  until num =~ /^[\d]+?/
    print 'Invalid number. Enter a valid number: '
    num = gets.chomp
    end
  return num
end

num
num1 = num.to_i

puts "\nChoose an Operation"
operation = gets.chomp

puts "\nEnter another number"
num
num2 = num2.to_i

# puts "\nEnter the second number."
# num2 = gets.chomp.to_i
# if num2 =~ /^[\d]+?/ || num2.to_i <= 0 && operation == "divide" || operation == "/"
#   print 'Invalid number. Enter a valid number: '
#   num2 = gets.chomp.to_i
# end

  # if num2 <= 0 && operation == "divide" || operation == "/"
  #   puts "Invalid entry for a denominator. Please enter a number greater than 0."
  #   operation = gets.chomp
  # end
#   while num1 == /^[\d]+?/ || num2 == /^[\d]+?/ do
#     user_input
#   end
# end


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

# handle the input from user
