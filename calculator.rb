# If the result is a whole number, program should return an integer. Otherwise, it should return a float rounded to 2 decimal points.
def checkForDecimal(num)
  if num % 1 == 0
    num = num.to_i
  else
    num = num.to_f
  end
end

# Methods for each operator
def add(num1, num2)
  result = num1 + num2
end

def subtract(num1, num2)
  result = num1 - num2
end

def multiply(num1, num2)
  result = num1 * num2
end

def divide(num1, num2)
  result = num1 / num2
end

def exponent(num1, num2)
  result = num1 ** num2
end

def modulo(num1, num2)
  result = num1 % num2
end

# Methods for getting user numbers. Proram should keep prompting user until they enter an integer.
def getUserNumber
  begin
    return Float(gets.chomp)
  rescue
    puts "Please enter the number as an integer."
    retry
  end
end

# Program should continuously run until the user manually quits
continue = " "
while continue != "q"

  # Ask user for an operation, should accept strings or symbols for each operation supported by the program
  puts "Welcome to the Ada calculator! Currently our machine can handle the following operations: Add (+), Subtract (-), Multiply (*), Divide (/), Exponent (^), and Modulo (%). Please select one operation (type either the name or the symbol): "
  operators = %w(add + subtract - multiply * divide / exponent ^ modulo %)
  operator = gets.chomp.downcase
  until operators.include?(operator)
    puts "Please enter one of the following operations: Add (+), Subtract (-), Multiply (*), Divide (/), Exponent (^), or Modulo (%). Please select one operation (type either the name or the symbol): "
    operator = gets.chomp.downcase
  end

  # Ask user for two numbers
  puts "Please enter your first number: "
  num1 = getUserNumber
  checkForDecimal(num1)

  puts "Please enter your second number: "
  num2 = getUserNumber
  checkForDecimal(num2)

  # If user is dividing numbers, prompt them for different numbers if they attempt to divide something by 0
  while (operator == "/" || operator == "divide") && num2 == 0
    puts "Sorry, you can't divide a number by 0. Please re-type the numbers you would like to divide: "
    num1 = getUserNumber
    num2 = getUserNumber
  end

  # Return the result
  case operator
  when "add", "+"
    result = add(num1, num2).round(2)
    puts "#{num1} + #{num2} = #{result}"
  when "subtract", "-"
    result = subtract(num1, num2).round(2)
    puts "#{num1} - #{num2} = #{result}"
  when "multiply", "*"
    result = multiply(num1, num2).round(2)
    puts "#{num1} * #{num2} = #{result}"
  when "divide", "/"
    result = divide(num1, num2).round(2)
    puts "#{num1} / #{num2} = #{result}"
  when "exponent", "^"
    result = exponent(num1, num2).round(2)
    puts "#{num1}^#{num2} = #{result}"
  when "modulo", "%"
    result = modulo(num1, num2).round(2)
    puts "#{num1} % #{num2} = #{result}"
  end

  puts "Would you like to do another operation? Type 'q' to quit or any key to continue: "
  continue = gets.chomp.downcase
end
