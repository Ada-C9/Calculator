def match_number(num) # creating a method to be used for both user number inputs
  until num.match(/^\-?\d*\.?\d*$/) && !num.empty?
    if !num.match(/^\-?\d*\.?\d*$/)
      print "Invalid input. Please enter a number: "
      num = gets.chomp
    end
    if num.empty?
      print "No number inputted. Please enter a number: "
      num = gets.chomp
    end
  end
end

def input_conversion(input) # to handle both float or integer input
  if input.include?(".")
    input.to_f
  else
    input.to_i
  end
end

possible_ops = {
  add: ["add", "+", "addition"],
  subtract: ["subtract", "-", "subtraction"],
  multiply: ["multiply", "*", "multiplication"],
  divide: ["divide", "/", "division"],
  exponent: ["exponent", "^"],
  modulo: ["modulo", "%"]}

puts "Please enter a mathematical operation and two numbers. \n \n"
print "First Number: "
input1 = gets.chomp
match_number(input1)
input1 = input_conversion(input1)

print "Second Number: "
input2 = gets.chomp
match_number(input2)
input2 = input_conversion(input2)

print "Operation: "
opInput = gets.chomp
until possible_ops.values.flatten.include?(opInput) # checking if the input is included in the possible operations
  print "Invalid operation. Try again: "
  opInput = gets.chomp
end

def add(num1, num2)
  answer = num1 + num2
  return "#{num1} + #{num2} = #{answer}"
end

def subtract(num1, num2)
  answer = num1 - num2
  return "#{num1} - #{num2} = #{answer}"
end

def multiply(num1, num2)
  answer = num1 * num2
  return "#{num1} * #{num2} = #{answer}"
end

def divide(num1, num2)
  until num2 != 0
    puts "Invalid entry. Can't divide by zero."
    print "Please choose another number: "
    num2 = gets.chomp
    match_number(num2)
    num2 = input_conversion(num2)
  end
  answer = num1 / num2
  return "#{num1} / #{num2} = #{answer}"
end

def exponent(num1, num2)
  answer = num1 ** num2
  return "#{num1} ^ #{num2} = #{answer}"
end

def modulo(num1, num2)
  answer = num1 % num2
  return "#{num1} % #{num2} = #{answer}"
end

case
when possible_ops[:add].include?(opInput)
  total = add(input1, input2)
when possible_ops[:subtract].include?(opInput)
  total = subtract(input1, input2)
when possible_ops[:multiply].include?(opInput)
  total = multiply(input1, input2)
when possible_ops[:divide].include?(opInput)
  total = divide(input1, input2)
when possible_ops[:exponent].include?(opInput)
  total = exponent(input1, input2)
when possible_ops[:modulo].include?(opInput)
  total = modulo(input1, input2)
else
  puts "That operation is not valid."
end

puts total
