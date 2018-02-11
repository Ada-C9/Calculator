
# Program for calculator.
puts " Welcome to the calculator "
operators_array = %w[add + subtract - divide / multiply * % ^]
puts operators_array

# To verify whether the user enteres a valid operator
puts "Which operation would you like to perform "
operation = gets.chomp
while !operators_array.include?(operation)
  print "Invalid input,Please try again\n"
  operation = gets.chomp
end

# To know when it needs to return an _integer_ versus a _float_.
def convert_i_f(value)
  if (value =~ /\./)
    value = value.to_f
  elsif
    value = value.to_i
  end
  return value
end

# To check whether the user input is numeric for first number
flag = true
while flag
  puts "Enter the first number "
  num1 = gets.chomp
  if (num1 =~ /[a-zA-Z]/)
    print "Invalid input; Please input again\n"
  else
    flag = false
  end
end
f_num = convert_i_f(num1)

# To check whether the user input is numeric for second number
flag = true
flag = true
while flag
  puts "Enter the second number "
  num2 = gets.chomp
  if (num2 =~ /[a-zA-Z]/)
    print "Invalid input; Please input again\n"
  else
    flag = false
  end
end

s_num = convert_i_f(num2)

# To handle division by zero
while (s_num == 0 ) && (operation == "division" || operation == "/")
  puts " Can't divide by Zero,Enter the input again "
  num2 = gets.chomp
  s_num = convert_i_f(num2)
end

# To perform the operations

if operation == "add" || operation == "+"
  result = f_num + s_num
elsif operation == "subtract" || operation == "-"
  result = f_num - s_num
elsif operation == "multiply" || operation == "*"
  result = f_num * s_num
elsif operation == "division" ||operation == "/"
  result = f_num/s_num
elsif operation == "modulo" || operation == "%"
  result = f_num % s_num
elsif operation == "^"
  result = f_num**s_num
end
puts "#{num1} #{operation} #{num2} = #{result}"
