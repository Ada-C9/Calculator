# Define the methods

def add(num1, num2)
  (num1 + num2)
end

def subtract(num1, num2)
  (num1 - num2)
end

def divide(num1, num2)
  if num2 == 0
    'No division by zero!'
  else
    (num1 / num2)
  end
end

def multiply(num1, num2)
  (num1 * num2)
end

def modulo(num1, num2)
  (num1 % num2)
end

def exponents(num1, num2)
  (num1**num2)
end

# Create an array with all operators

operators = ['add', '+', 'subtract', '-', 'multiply', '*',
             'divide', '/', 'exponent', '^', 'modulo', '%']

# Welcome user message

puts 'Welcome to my Calculator!'
print "\nWhat operation would you like to perform? "
operator = gets.chomp
until operators.include?(operator)
  puts "That's not an available operator "
  print 'Please enter an operator: '
  operator = gets.chomp
end

print "\nPlease enter the first number: "
num1 = gets.chomp
print 'Please enter the second number: '
num2 = gets.chomp

# Checking for user input to be a number

until (num1.to_i.to_s == num1.to_s) && (num2.to_i.to_s == num2.to_s)
  puts "That's not an acceptable number!"
  print 'Please enter a number: '
  num1 = gets.chomp
  print "\nPlease enter another number: "
  num2 = gets.chomp
end

# Convert to a float
num1 = num1.to_f
num2 = num2.to_f

# Calculate
case operator
when 'add', '+'
  result = add(num1, num2)
  operator = '+'
when 'subtract', '-'
  result = subtract(num1, num2)
  operator = '-'
when 'multiply', '*'
  result = multiply(num1, num2)
  operator = '*'
when 'divide', '/'
  result = divide(num1, num2)
  operator = '/'
when 'exponent', '^'
  result = exponents(num1, num2)
  operator = '**'
when 'modulo', '%'
  result = modulo(num1, num2)
  operator = '%'
end

# Output

puts "\n#{num1} #{operator} #{num2} = #{result}\n"
