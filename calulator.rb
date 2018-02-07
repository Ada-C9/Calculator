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

def exponent(num1,num2)
  return num1 ** num2
end

class String
  def numeric?
    Float(self) != nil rescue false
  end
end

operators = [
  "add","+","subtract","-","multiply","*", "divide","/", "power of",
  "^", "exponent"
]
# User imput examples
# add 3 to 4
# add 3 + 4
# 3 + 4

puts "Welcome to the calculator! How can I help you?"
# input = gets.chomp
# if input includes "add or +" find the numbers and do addition

print "Would you like to add(+), subtract(-), multiply(*), divide(/), or "
print "two numbers? You can also find the power of/exponent(^) of a number? "
operator = gets.chomp.downcase

# checks that operator exsists in the program
while !operators.include?(operator)
  puts "That is not an operation the calculator supports."
  print "Please choose add(+), subtract(-), multiply(*), divide(/), or power of(^): "
  operator = gets.chomp.downcase
end

# asks for the first number
print "Please give me the first number: "
num1 = gets.chomp

while !num1.numeric?
  print "That is not a number. Please enter a number: "
  num1 = gets.chomp
end

num1 = num1.to_f

# asks for the second number
print "Please give me the second number: "
num2 = gets.chomp

while !num2.numeric?
  print "That is not a number. Please enter a number: "
  num2 = gets.chomp
end

num2 = num2.to_f

if num2 == 0
  puts "I'm sorry, but I can't divide by 0."
  puts"Please run the program again to select a new equation."
  return
end

case operator
when "add", "+"
  puts "#{num1} + #{num2} = #{add(num1,num2)}"
when "subtract", "-"
  puts "#{num1} - #{num2} = #{subtract(num1,num2)}"
when "multiply", "*"
  puts "#{num1} * #{num2} = #{multiply(num1,num2)}"
when "divide", "/"
  puts "#{num1} / #{num2} = #{divide(num1,num2)}"
when "power of","^", "exponent"
  puts "#{num1} ^ #{num2} = #{exponent(num1,num2)}"
end
