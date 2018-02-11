puts "Thank you for choosing my calculator"
answer = 0

def is_numeric(s)
  # This begin / rescue block is for exception catching.
  # We need it because we're trying to convert string to float and it might fail if string contains non-numeric characters
  # on successful conversion - it will return true, else false
  begin
    Float(s)
  rescue
    false # not numeric
  else
    true # numeric
  end
end


def get_numeric_input
  while user_input = gets.chomp # loop while getting user input
    isInputOK = is_numeric(user_input)
    case isInputOK
    when true
      break # make sure to break so you don't ask again
    else
      puts "Please enter valid number"
    end
  end
  return user_input
end

# calculate addition
def add
  puts "Please enter your first number"
  num1 = get_numeric_input.to_f
  puts "Please enter your second number"
  num2 = get_numeric_input.to_f
  answer = num1 + num2
  puts "The answer is #{answer}"
end

# calculate subtraction
def subtract
  puts "Please enter your first number"
  num1 = get_numeric_input.to_f
  puts "Please enter your second number"
  num2 = get_numeric_input.to_f
  answer = num1 - num2
  puts "The answer is #{answer}"
end

# calculate multiplication
def multiply
  puts "Please enter your first number"
  num1 = get_numeric_input.to_f
  puts "Please enter your second number"
  num2 = get_numeric_input.to_f
  answer = num1 * num2
  puts "The answer is #{answer}"
end

# calculate division include division by 0
def divide
  puts "Please enter your first number"
  num1 = get_numeric_input.to_f
  puts "Please enter your second number"
  num2 = get_numeric_input.to_f
  if num2 != 0 then
    answer = num1 / num2
    puts "The answer is #{answer}"
  else
    puts "Error. Division by 0 is not allowed"
  end
end

# asking for user input and checking if the input is valid
puts "Please choose 'ADD' 'SUBTRACT' 'MULTIPLY' or 'DIVIDE'"
symbol = gets.chomp.downcase
valid_input = false
while valid_input == false
  if symbol == "add" || symbol == "+" then
    add
    valid_input = true
  elsif symbol == "subtract" || symbol == "-" then
    subtract
    valid_input = true
  elsif symbol == "multiply" || symbol == "*" then
    multiply
    valid_input = true
  elsif symbol == "divide" || symbol == "/" then
    divide
    valid_input = true
  else
    puts "Unknown operator"
    puts "Please choose 'ADD' 'SUBTRACT' 'MULTIPLY' or 'DIVIDE'"
    symbol = gets.chomp.downcase
  end
end
