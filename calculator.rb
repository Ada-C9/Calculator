puts "Welcome to my calculator app"
# take user input for operation, validate user response
print "Please enter a math operation:\t"
operation = gets.chomp.upcase
until ["ADD", "ADDITION","PLUS", "+", "SUBTRACTION", "MINUS", "SUBTRACT", "-",
  "TIMES", "MULTIPLY", "MULTIPLICATION", "*", "X", "DIVIDE", "DIVISION",
   "/", "EXPONENT", "^", "**", "MODULO", "MODULUS", "%"].include?operation
  print "\tPlease enter a valid math operation:\t"
  operation = gets.chomp.upcase
end

print "Please enter a number:\t"
first_num = gets.chomp
first_num_array = first_num.to_s.split("\.")

# check for letter inputs first_num
while first_num =~ /[A-Za-z\D]/
  print "\tPlease enter a valid number:\t"
  first_num = gets.chomp
end

#convert to float or integer
if first_num_array.length > 1
    first_num = first_num.to_f
else
    first_num = first_num.to_i
end
# puts first_num.class

print "Please enter a second number:\t"
second_num = gets.chomp
second_num_array = second_num.to_s.split("\.")

# check for letter inputs second_num
while second_num =~ /[A-Za-z\D]/
  print "Please enter a valid number:\t"
  second_num = gets.chomp
end

#convert to float or integer second_num
if second_num_array.length > 1
    second_num = second_num.to_f
else
    second_num = second_num.to_i
end
# puts second_num.class
operation_symbol = ""
answer = ""
case operation
  when "ADD", "ADDITION", "+", "PLUS"
    operation_symbol = "+"
    answer = first_num + second_num
  when "SUBTRACTION", "MINUS", "SUBTRACT", "-"
    operation_symbol= "-"
    answer = first_num - second_num
  when "TIMES", "MULTIPLY", "MULTIPLICATION", "*", "X"
    operation_symbol = "*"
    answer = first_num * second_num
  when "DIVIDE", "DIVISION", "/"
    operation_symbol = "/"
    if second_num == 0
      answer = "Not a number"
    else
      answer = first_num / second_num
    end
  when "EXPONENT", "^", "**"
    operation_symbol = "**"
    answer = first_num ** second_num
  when "MODULO", "MODULUS", "%"
    operation_symbol = "%"
    answer = first_num % second_num
  else
    puts "invalid entry"
end

puts "#{first_num} #{operation_symbol} #{second_num} = #{answer}"
