# List of operations supported by the program
operations = ["add", "+", "subtract", "-", "multiply", "*", "divide", "/", "^"]

# Welcome message and instruction
puts "Welcome to the calculator program. What operation do you want to do? Please choose one from the following list: "
puts operations

# Collect operation choice from user
user_operation = gets.chomp
until operations.include?(user_operation)
  puts "Please make a valid choice: "
  user_operation = gets.chomp
end

# Collect first number from user
print "Please provide the first integer: "
first_integer_string = gets.chomp
first_integer = first_integer_string.to_i
until first_integer.to_s == first_integer_string
  print "This isn't an integer. Please provide a valid integer: "
  first_integer_string = gets.chomp
  first_integer = first_integer_string.to_i
end

# Collect second number from user
print "Please provide the second integer: "
second_integer_string = gets.chomp
second_integer = second_integer_string.to_i
until second_integer.to_s == second_integer_string
  print "This isn't an integer. Please provide a valid integer: "
  second_integer_string = gets.chomp
  second_integer = second_integer_string.to_i
end

# Calculate and output result
puts "Here is the result: "
case user_operation
  when "add", "+"
    puts "#{first_integer} + #{second_integer} = #{first_integer + second_integer}"
  when "subtract", "-"
    puts "#{first_integer} - #{second_integer} = #{first_integer - second_integer}"
  when "multiply", "*"
    puts "#{first_integer} * #{second_integer} = #{first_integer * second_integer}"
  when "divide", "/"
    if second_integer == 0
      puts "For division, the divisor cannot be 0."
    else
      puts "#{first_integer} / #{second_integer} = #{first_integer / second_integer}"
    end
  when "^"
    puts "#{first_integer}^#{second_integer} = #{first_integer ** second_integer}"
end
puts "Thank you for using the Calculator program."
