# calculator assignment:
# https://github.com/AngelaPoland/Calculator

# welcome and prompt message, get user input

puts "Hello! I'm going to try to help you do some math!"

attempts = 0

puts "Please enter the type of operation you want to use:"
operation = gets.chomp

# give user 3 chances to enter valid operation

valid_operations = ["+", "add", "addition", "-", "subtract", "subtraction",
  "*", "multiply", "multiplication", "/", "divide", "division"]

until valid_operations.include? operation
  if attempts < 4
    puts "That math may be too complicated for me. Let's try to either
    add, subtract, multiply, or divide only. Please try again:"
    operation = gets.chomp
    attempts +=1
  else
    puts "Sorry, three strikes and you're out."
  end
end

# get user input numbers and check that they are numerical
# before converting to integer
# give user 3 chances before kickin' them out.

puts "Now enter your first number:"
first_num = gets.chomp

attempts = 0

while (first_num != 0) && (first_num.to_i.to_s != first_num.strip)
  if attempts < 3
    puts "Oops! That is not a number, please try again:"
    first_num = gets.chomp
    attempts += 1
  else
    puts "Sorry, three strikes and you're out."
    exit
 end
end


first_num = first_num.to_f

puts "And then your second number:"
sec_num = gets.chomp

while (sec_num != 0) && (sec_num.to_i.to_s != sec_num.strip)
  if attempts < 3
    puts "Oops! That is not a number, please try again:"
    sec_num = gets.chomp
    attempts += 1
  else
    puts "Sorry, three strikes and you're out."
    exit
 end
end

sec_num = sec_num.to_f

# create some methods for the actual math

def add(num_one, num_two)
  return num_one + num_two
end

def sub (num_one, num_two)
  return num_one - num_two
end

def mult (num_one, num_two)
  return num_one * num_two
end

def div (num_one, num_two)
  return num_one / num_two
end


case operation
 when "add", "+", "addition"
  result = add(first_num, sec_num)
  puts "We used addition and your result is: #{result}"
 when "subtract", "-", "subtraction"
  result = sub(first_num, sec_num)
  puts "We used subtraction and your result is: #{result}"
 when "*", "multiply", "multiplication"
  result = mult(first_num, sec_num)
  puts "We used multiplication and your result is: #{result}"
 when "/", "divide", "division"
  result = div(first_num, sec_num)
  puts "We used division and your result is: #{result}"
 else "Sorry, I don't know that operation."
end
