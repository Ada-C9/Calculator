#Calculator Homework
def check_numeric_input
  input = gets.chomp
  check_string = /[a-zA-Z]/.match(input)
  until check_string == nil
    puts "\nInvalid input. Please enter a number: "
    input = gets.chomp
    check_string = /[a-zA-Z]/.match(input)
  end
  if (/[.]/.match(input) == nil)
    #integer
    input = input.to_i
  else
    #float
    input = input.to_f
  end
  return input
end

# for troubleshooting method shown above
# num = check_numeric_input
# puts "num = #{num}"

#array of valid operations
operation_arr = %w[add + subtract - multiply * divide / exponify ** ^ modulo %]

#operation user input
puts "Please enter an operation: "
operation = gets.chomp
until operation_arr.include?(operation)
  puts "\nInvalid operation. Please try again: "
  operation = gets.chomp
end

#numeric user input
puts "Please enter your first number: "
num1 = check_numeric_input
puts "Please enter your second number: "
num2 = check_numeric_input
while (operation == "divide" || operation == "/") && num2 == 0
  puts "You cannot divide by zero. Please enter another value."
  num2 = check_numeric_input
end

#calculation
if operation == "add" || operation == "+"
  output = num1 + num2
elsif operation == "subtract" || operation == "-"
  output = num1 - num2
elsif operation == "multiply" || operation == "*"
  output = num1 * num2
elsif operation == "divide" || operation == "/"
  output = num1 / num2
elsif operation == "exponify" || operation == "**" || operation == "^"
  output = num1 ** num2
elsif operation == "modulo" || operation == "%"
  output = num1 % num2
end

#Answer output
puts "Answer: #{output}"
