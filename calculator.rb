# Define operators supported
operators = [
  "add","+","subtract","-","multiply",
  "*","divide","/","^","%"
]

# Define methods used

def format(string)
  string = string.gsub(",","")
  string = string.gsub("_","")
  if string =~ /[.]/
    string = string.to_f
  else
    string = string.to_i
  end
end

def add (num1, num2)
  return format(num1) + format(num2)
end

def subtract (num1, num2)
  return format(num1) - format(num2)
end

def multiply (num1, num2)
  return format(num1) * format(num2)
end

def divide (num1, num2)
  if num2 == "0"
    return "SORRY! You cannot divide by 0"
  end
  return format(num1) / format(num2)
end

def exponent (num1, num2)
  return format(num1) ** format(num2)
end

def modulo (num1, num2)
  if num2 == "0"
    return "SORRY! You cannot divide by 0"
  end
  return format(num1) % format(num2)
end

# Welcome User
puts "\nWelcome to the Calculator App!"

# Get user input for two numbers and operator
print "\nPlease enter a number: "
num1 = gets.chomp
until num1 =~ /^-?\d+(,\d+)?(_\d+)?(\.\d+)?$/
  puts "That's not an acceptable number."
  print "Please enter a number: "
  num1 = gets.chomp
end

print "\nPlease enter another number: "
num2 = gets.chomp
until num2 =~ /^-?\d+(,\d+)?(_\d+)?(\.\d+)?$/
  puts "That's not an acceptable number."
  print "Please enter a number: "
  num2 = gets.chomp
end

print "\nAvailable operators include: "
(operators.length-1).times do |i|
  print ", #{operators[i]}"
end
print ", and #{operators[operators.length-1]}"
print "\nPlease enter an operator: "
oper = gets.chomp

until operators.include?(oper)
  puts "That's not an available operator."
  puts "Please enter an operator."
  oper = gets.chomp
end

# Calculate solution
case oper
when "add","+"
  solution = add(num1,num2)
  oper = "+"
when "subtract","-"
  solution = subtract(num1,num2)
  oper = "-"
when "multiply","*"
  solution = multiply(num1,num2)
  oper = "*"
when "divide","/"
  solution = divide(num1,num2)
  oper = "/"
when "^"
  solution = exponent(num1,num2)
when "%"
  solution = modulo(num1,num2)
end

# Output the problem and solution
puts "\n#{num1} #{oper} #{num2} = #{solution}\n"
