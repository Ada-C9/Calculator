# The program should use the input operation and
# two numbers to provide the result of applying the operation to the two numbers.
#
# The program should have support for these
# four operations: addition, subtraction, multiplication, and division.
# The program should accept both
# the name (add) and the symbol (+) for each possible operation.

# acceptable operators
#this is inelegant I know, I ran out of time!
operators = [ "\+","\-","\*","\/","divide","DIVIDE","Divide","Div","DIV",
  "div","add","addition","Add","ADD","ADDITION","Addition",
  "subtract","Subtract","sub","Sub","SUB","SUBTRACT","mult",
  "multiply","Multiply","MULTIPLY"
]

# methods
def add(num_one, num_two)
  return convert_input(num_one) + convert_input(num_two)

end

def subtract(num_one, num_two)
  return convert_input(num_one) - convert_input(num_two)

end

def multiply(num_one, num_two)
  return convert_input(num_one) * nconvert_input(num_two)

end

def divide(num_one, num_two)
  return convert_input(num_one)/ convert_input(num_two)

end
# need to change the reg exp to reject things like punctuation
def num_check(first_num)

  while first_num =~ /[a-zA-Z]/
    print "That is not a valid number. Please Enter a number."
    first_num = gets.chomp

  end

end

def second_num_check(second_num)
  while second_num =~ /[a-zA-Z]/
    print "That is not a valid number. Please Enter a number."
    second_num = gets.chomp

  end

end

# converts user input to a numeral.
def convert_input(string)
  if string.include?(".")
    return string.to_f
  else
    return string.to_i

  end
end

# gets user input
puts "I'm a calculator."

print "\nenter a number\s"
first_num = gets.chomp

# checks if user input is a number
num_check(first_num)

print "\ndo you want to add, subtract, multiply or divide\s?"
operation = gets.chomp

until operators.include?(operation)
  print "The calculator does not recognize your input. Please put in an appropriate operator."
  operation = gets.chomp

end

print "\nenter another number\s"
second_num = gets.chomp
# checks user input for second number
second_num_check(second_num)

case operation
when "\/","divide","DIVIDE","Divide","Div","DIV","div"
  while second_num == "0"
    print "You are trying to divide by zero please enter another number."
    second_num = gets.chomp
    second_num_check(second_num)
  end

end

# does the calculation of the user input
case operation
when "\+","add","addition","Add","ADD","ADDITION","Addition"
  puts add(first_num, second_num)
when "\-","subtract","Subtract","sub","Sub","SUB","SUBTRACT"
  puts subtract(first_num, second_num)
when "\*","mult","multiply","Multiply","MULTIPLY"
  puts multiply(num_one, num_two)
when "\/","divide","DIVIDE","Divide","Div","DIV","div"
  puts divide(first_num, second_num)
else
  print "The calculator does not recognize your input. Please put in an appropriate operator."
# Need to give the option to try again
end
