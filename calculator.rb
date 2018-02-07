# Week#1: Calculator Build
# Ana Lisa Sutherland - Octos C9

# method for addition using two numbers
def addition (num_one, num_two)
  return num_one + num_two
end
#method for subtracting using two numbers
def subtraction (num_one, num_two)
  return num_one - num_two
end
#method for multiplication using two numbers
def multiply (num_one, num_two)
  return num_one * num_two
end
#method for division using two numbers
def divide (num_one, num_two)
  return num_one / num_two
end
#OPTIONAL: ENSURE IT IS ONLY NUMBERS THAT ARE ENTERED
def req ()
  num = gets.chomp
  until num =~ /^[1-9]\d*(\.\d+)?$/
    if num =~ /^[1-9]\d*(\.\d+)?$/
      return num
    else
      puts "Invalid number."
      num = gets.chomp
    end
  end
  if num =~ /\A\d+\z/
    puts 'integer'
    return num.to_i
  elsif num =~ /\A\d+\.\d+\z/
    puts 'float'
    return num.to_f
  else
    puts 'not integer or float'
  end
end
#OPTIONAL: method for exponents
# def exponent (num_one, num_two)
#   return num_one ** num_two
# end

#OPTIONAL: method for modulo
# def modulo (num_one, num_two)
#   return num_one % num_two
# end

#collect first number from the user and run it through req method
puts "Welcome, seems like you need a calculator.\n\Please Input a number."
num_1 = req()
puts "Enter a command."
# make sure that only operators are accepted
command_use = gets.chomp
until ["add", "+", "subtract", "-","multiply", "*", "divide", "/"].include?(command_use)
  #OPTIONAL: For modulo and exponents
  # until ["add", "+", "subtract", "-","multiply", "*", "divide", "/", "**", "^", "modulo", "%"].include?(command_use)
  puts "Please put a valid command!"
  command_use = gets.chomp
end

#collect second number from the user and run it through req method
puts "Enter a second number."
num_2 = req()

#method to utilize both written and modifying commands
case command_use
when "add", "+"
  puts "We're adding numbers"
  result = addition(num_1,num_2)
when "subtract", "-"
  puts "We're subtracting numbers"
  result = subtraction(num_1,num_2)
when "multiply", "*"
  puts "We're multiplying numbers"
  result = multiply(num_1,num_2)
when "divide", "/"
  puts "We're dividing numbers"
  if num_2 != 0
    result = divide(num_1,num_2)
  else
    puts "You cannot divide by 0."
  end
  #OPTIONAL: method for exponents and modulos
  # when "^", "**"
  #   puts "We're exponentiating numbers"
  #   result = exponent(num_1,num_2)
  #when "modulo", "%"
  # puts "We are using a modulo for numbers."
  # results = modulo(num_1,num_2)
else
  puts "That makes no sense. Please tell me which operator you want to use."
  command = gets.chomp
end
puts "#{num_1} #{command_use} #{num_2} = #{result}"
