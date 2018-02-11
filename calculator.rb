
#method within the string class that returns false if element cannot be converted into a float
class String
  def valid_float?
    true if Float self rescue false
  end
end

#addition method
def addition (num1, num2)
  num1 + num2
end

#subtraction method
def subtraction (num1, num2)
  num1 - num2
end

#multiplication method
def multiplication (num1, num2)
  num1 * num2
end

#division method
def division (num1, num2)
  answer = num1.to_f / num2
end

#exponent method
def exponential (num1, num2)
  num1 ** num2
end

#modulo method
def modulo (num1, num2)
  num1 % num2
end
#array of possible operators
ops_symbol = ["*", "-", "+", "/", "^", "%"]
ops_spelled = ["add", "subtract", "multiply", "divide", "exponent", "modulo"]

#beginning of output
puts "Welcome to the calculator app! "

#prompts for user inputs
puts "Please enter a number: "
user_num1 = gets.chomp
while user_num1.valid_float? == false
  puts "Please enter a real number: "
  user_num1 = gets.chomp
end
user_num_one = user_num1.to_i

puts "Please enter a number: "
user_num2 = gets.chomp
while user_num2.valid_float? == false
  puts "Please enter a real number: "
  user_num2 = gets.chomp
end
user_num_two = user_num2.to_i


puts "Please enter one of the following operations: add(+), subtract(-), multiple(*), divide(/), exponent(^), modulo(%)"
user_operator = gets.chomp


#checks that operator matches something from the array of operators
until (ops_symbol.include? user_operator) || (ops_spelled.include? user_operator)
  puts "Sorry, I can't process that. Please enter a operator: "
  user_operator = gets.chomp
end

#does not let the user divide by 0, re-prompts for the second number
if (user_operator == "/" or user_operator == "divide") && user_num2 == 0
    puts "Sorry. You can't divide by zero! Please choose something else. "
    puts "Please enter a second number: "
    user_num2 = gets.chomp
    while user_num2.valid_float? == false
      puts "Please enter a real number: "
      user_num2 = gets.chomp
    end
    user_num_two = user_num2.to_i
end


#case statement to decide which operator function to call
  case user_operator
  when "add","+"
    puts "#{user_num_one} + #{user_num_two} = #{addition(user_num_one,user_num_two)}"
  when "subtract","-"
    puts "#{user_num_one} - #{user_num_two} = #{subtract(user_num_one,user_num_two)}"
  when "multiply","*"
    puts "#{user_num_one} * #{user_num_two} = #{multiplication(user_num_one,user_num_two)}"
  when "divide","/"
    puts "#{user_num_one} / #{user_num_two} = #{division(user_num_one,user_num_two)}"
  when "exponent","^"
    puts "#{user_num_one} ^ #{user_num_two} = #{exponential(user_num_one,user_num_two)}"
  when "modulo","%"
    puts "#{user_num_one} % #{user_num_two} = #{modulo(user_num_one,user_num_two)}"
  else
    puts "That didn't work, sorry!"
  end
