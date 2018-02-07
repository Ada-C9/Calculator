# welcome message
puts "------ Welcome to my calculator! ------"
puts "\nLet's do some calculations."
print "Would you like to add (+), subtract (-), multiply (*), divide (/),
exponify (**), or find the remainder (%) of two values? > "
user_input = gets.chomp.downcase

operations = ["add", "+", "subtract", "-", "multiply", "*", "divide", "/",
"exponify", "**", "remainder", "%"]

# prompt user to select an option from the array
until operations.include?(user_input)
    puts "I am sorry, that is not an option"
    print "Would you like to add (+), subtract (-), multiply (*), divide (/),
    exponify (**), or find the remainder (%) of two values? > "
    user_input = gets.chomp.downcase
end

# prompt user to input first value for the equation
puts "Great! Now give us two values that you want to use: "
print "What is your first value? > "
num1 = gets.chomp

# outputs error until user provides a valid input
until /^[\d]+?/.match(num1)
  puts "Please give valid number values"
  print "What is your first value? > "
  num1 = gets.chomp
end

# prompt user to input second value for the equation
print "What is your second value? > "
num2 = gets.chomp

# outputs error until user provides a valid input
until /^[\d]+?/.match(num2)
  puts "Please give valid number values"
  print "What is your second value? > "
  num2 = gets.chomp
end

num1 = num1.to_i
num2 = num2.to_i

# I started trying to figure out how to convert the numerator inputs into either a float or integer
# num1 = "%g" % ("%.2f" % num1)
# num2 = "%g" % ("%.2f" % num2)
# def to_f_or_i_or_s(num1)
#   ((float = Float(num1)) && (float % 1.0 == 0) ? float.to_i : float) rescue num1
# end
# def distance_from_zero(num1)
#   if type(num1) == int or type(num1) == float
#     print abs(num1)
#   end
# end

# method for the add operator
def add(num1, num2)
  return num1 + num2
end

# method for the subtract operator
def subtract(num1, num2)
  return num1 - num2
end

# method for the multiply operator
def mutiply(num1, num2)
  return num1 * num2
end

# # method for the divide operator
def divide(num1, num2)
  until num2 != 0
    print "Please provide a divisor value greater than zero. > "
    num2 = gets.chomp.to_i
  end
  return num2, num1 / num2
end

# method for computing exponents
def exponents(num1, num2)
  return num1 ** num2
end

# method for the modulo operator
def remainder(num1, num2)
  return num1 % num2
end

# prints out equation based on user's input
# prints out result
case user_input
when "add", "+"
  result = add(num1, num2)
  puts "#{num1} + #{num2} = #{result}"
when "subtract", "-"
  result = subtract(num1, num2)
  puts "#{num1} - #{num2} = #{result}"
when "multiply", "*"
  result = mutiply(num1, num2)
  puts "#{num1} * #{num2} = #{result}"
when "divide", "/"
  num2, result = divide(num1, num2)
  puts "#{num1} / #{num2} = #{result}"
when "exponify", "**"
  result = exponents(num1, num2)
  puts "#{num1} ^ #{num2} = #{result}"
when "remainder", "%"
  result = remainder(num1, num2)
  puts "#{num1} % #{num2} = #{result}"
end
