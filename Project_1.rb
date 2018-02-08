# definition of methods
def add(num1,num2)
  return num1 + num2
end

def subtract(num1,num2)
  return num1 - num2
end

def multiply(num1,num2)
  return num1 * num2
end

def divide(num1,num2)
  return num1 / num2
end

def numberic?(string)
  /[%\+\*\d]/.match(string)
end

def empty?(input)
  if input.empty?
    puts "You did not enter anything!"
  end
end

def type?(input)
  if /\A\d+\z/.match(input)
    return "integer"
  elsif /\A\d+\.\d+\z/.match(input)
    return "float"
  end
end


puts "Welcome to your calculator!\n"

puts "I can add, subtract, multiply or divide\n"

puts "Please enter the operator you want to use : add, + , subtract, - , multiply, * , divide , / "
user_input = gets.chomp.downcase

empty?(user_input)

# to make sure the user input is a valid operator
arr_operators = ["add","+", "subtract", "-", "multiply", "*" , "divide", "/"]

attempt = 0
while !arr_operators.include?(user_input)
  if attempt < 3
    attempt += 1
    puts "Please enter a valid operator. You have #{(-attempt + 3) + 1} more attempts.\n"
    puts "Operator options: add, subtract, multiply, divide, +, - , *, /"
    user_input = gets.chomp
  else
    puts "Too many attempts..start the program again"
    exit
  end
end

print "Please enter value 1: "
num1 = gets.chomp

empty?(num1)

until numberic? num1 do
  puts "Please enter a numeric expression for value 1: "
  num1 = gets.chomp
end

print "\nPlease enter value 2: "
num2 = gets.chomp

empty?(num1)

until numberic? num2 do
  puts "Please enter a numeric expression for value 2: "
end

# To handle when user attempts to divide by zero.
if user_input == "divide" || user_input == "/"
  while num2 == 0
    puts "Cannot divide by 0. Please enter again the divisor"
    num2 = gets.chomp
  end
end

case user_input
when "add", "+"
  puts "\nAnswer: #{results = add(eval(num1), eval(num2))}"
  puts "#{num1} + #{num2} = #{results}"
when "subtract", "-"
  puts "\nAnswer: #{results = subtract(eval(num1),eval(num2))}"
  puts "#{num1} - #{num2} = #{results}"
when "multiply", "*"
  puts "\nAnswer: #{results = multiply(eval(num1),eval(num2))}"
  puts "#{num1} * #{num2} = #{results}"
when "divide", "/"
  puts "\nAnswer: #{results = divide(eval(num1),eval(num2))}"
  puts "#{num1} / #{num2} = #{results}"
end

# this will allow the program to know if the result should be printed as a float or an integer
if type?(num1) == "float"
  results.to_f
elsif type?(num1) == "integer" && type?(num2) == "integer"
  results.to_i
end
