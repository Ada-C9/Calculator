# M E T H O D S

def add(num1, num2)
  return (num1 + num2)
end
#---------------------------
def subtract(num1, num2)
  return (num1 - num2)
end
#----------------------------
def divide(num1, num2)
  if num2 == 0
    return "Remember you can not subtract a number by 0!!"
  else
    return (num1/num2)
  end
end
#----------------------------
def multiply(num1, num2)
  return (num1 * num2)
end
#----------------------------
def modulo(num1,num2)
  return (num1 % num2)
end
# --------------------------
def exponents(num1, num2)
  return (num1^num2)
end
puts "==================="
puts "C A L C U L A T O R"
puts "==================="
puts
again = "yes"
while again == "yes" do
puts "What kind of operation do you want to do?"
operation = gets.chomp
puts "---"
puts "Please give me the first number."
num1 = gets.chomp
puts "---"
puts "Please give me the second number."
num2 = gets.chomp

 # Checking if the user input is a number

until (num1.to_i.to_s == num1.to_s) && (num2.to_i.to_s == num2.to_s ) do
  puts "----------"
  puts "----------"
  puts "Ups! I need NUMBERS!, lets try again"
  puts "Please give me the first number."
  num1 = gets.chomp
  puts "---"
  puts "Please give me the second number."
  num2 = gets.chomp
end

#convert input to float so it know that it has to work as number.
# could not do it before because I had to check if the input was a number or not.
num1 = num1.to_f
num2 = num2.to_f

puts "-------------"
puts "RESULT:"
case operation
when "add", "+"
  result = add(num1, num2)
when "subtract", "-"
  result = subtract(num1, num2)
when "multiply", "*"
  result = multiply(num1, num2)
when "divide", "/"
  result = divide(num1, num2)
when "exponent", "^"
  result = exponents(num1, num2)
when "modulo" , "%"
  result = modulo(num1, num2)
else
  result =  "Something went wrong, why dont we try again?"
end
if operation == "divide"
  operation = "%"
elsif operation == "add"
  operation = "+"
elsif operation == "multiply"
  operation = "*"
elsif operation == "subtract"
  operation = "-"
end
puts
puts "#{num1} #{operation} #{num2}"
puts result
puts "---------------------"
puts
puts "Any other operation you want to do?"
again = gets.chomp
puts
puts
puts "--------------------"
end
