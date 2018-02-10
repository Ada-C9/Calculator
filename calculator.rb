# Welcome message
puts "Welcome to the calculator program."

# Instruction for choosing an operation
puts "What operation do you want to do? Please choose one from the following list: "
operations = ["add", "+", "subtract", "-", "multiply", "*", "divide", "/", "^", "%"]
puts operations

# Helper method to check user's choice
def user_choice_check choices
  user_choice = gets.chomp
  until choices.include?(user_choice)
    puts "Please make a valid choice: "
    user_choice = gets.chomp
  end
  return user_choice
end

# Collect user's choice for operations
user_operation = user_choice_check operations

# Instruction for choosing a number type
puts "What type of number are you entering? Please choose one from the following list: "
number_types = ["integer", "float"]
puts number_types

# Collect user's choice for number types
user_number_type = user_choice_check number_types

# Helper method to check integer input
def integer_check
  integer_string = gets.chomp
  integer = integer_string.to_i
  until integer.to_s == integer_string
    print "This isn't an integer. Please provide a valid input: "
    integer_string = gets.chomp
    integer = integer_string.to_i
  end
  return integer
end

# Helper method to check float input
def float_check
  float_string = gets.chomp
  float = float_string.to_f
  until float_string.include?(".") && (float.to_s == float_string)
    print "This isn't a float. Please provide a valid input: "
    float_string = gets.chomp
    float = float_string.to_f
  end
  return float
end

# Collect numbers from user
case user_number_type
  when "integer"
    print "Please provide the first integer: "
    first_number = integer_check
    print "Please provide the second integer: "
    second_number = integer_check
  when "float"
    print "Please provide the first float: "
    first_number = float_check
    print "Please provide the second float: "
    second_number = float_check
end

# Calculate and output result
puts "Here is the result: "
case user_operation
  when "add", "+"
    puts "#{first_number} + #{second_number} = #{first_number + second_number}"
  when "subtract", "-"
    puts "#{first_number} - #{second_number} = #{first_number - second_number}"
  when "multiply", "*"
    puts "#{first_number} * #{second_number} = #{first_number * second_number}"
  when "divide", "/"
    if second_number == 0
      puts "For division, the divisor cannot be 0."
    else
      puts "#{first_number} / #{second_number} = #{first_number / second_number}"
    end
  when "^"
    puts "#{first_number}^#{second_number} = #{first_number ** second_number}"
  when "%"
    puts "#{first_number} % #{second_number} = #{first_number % second_number}"
end
puts "Thank you for using the Calculator program."
