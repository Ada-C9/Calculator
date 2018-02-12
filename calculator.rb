def add(num1,num2)
  return num1 + num2
end

def subtract(num1,num2)
  return num1 - num2
end

def multiply(num1,num2)
  return num1 * num2
end

def divide(num1,num2)
  return num1 / num2
end

def exponent(num1,num2)
  return num1 ** num2
end

def mod(num1,num2)
  return num1 % num2
end

class String
  def numeric?
    Float(self) != nil rescue false
  end
end


operators = [
  "add","+","subtract","-","multiply","*", "divide","/", "power of",
  "^", "exponent", "remainder", "%"
]
# User imput examples for future program
# add 3 to 4
# add 3 + 4
# 3 + 4

puts "Welcome to the calculator! How can I help you?"

quit = false

while !quit
  print "You can add(+), subtract(-), multiply(*), divide(/), or "
  print "two numbers. You can also find the power of/exponent(^) of a number or "
  puts "the remainder when dividing two numbers."
  print "\nPlease choose add(+), subtract(-), multiply(*), divide(/), "
  print "power of(^), or remainder: "
  operator = gets.chomp.downcase

  # checks that operator exsists in the program
  while !operators.include?(operator)
    puts "That is not an operation the calculator supports."
    print "Please choose add(+), subtract(-), multiply(*), divide(/), "
    print "power of(^), or remainder: "
    operator = gets.chomp.downcase
  end

  # asks for the first number
  print "Please give me the first number: "
  num1 = gets.chomp

  while !num1.numeric?
    print "That is not a number. Please enter a number: "
    num1 = gets.chomp
  end

  num1 = num1.to_f

  # asks for the second number
  print "Please give me the second number: "
  num2 = gets.chomp

  while !num2.numeric?
    print "That is not a number. Please enter a number: "
    num2 = gets.chomp
  end

  num2 = num2.to_f

  case operator
  when "add", "+"
    puts "#{num1} + #{num2} = #{add(num1,num2)}"
  when "subtract", "-"
    puts "#{num1} - #{num2} = #{subtract(num1,num2)}"
  when "multiply", "*"
    puts "#{num1} * #{num2} = #{multiply(num1,num2)}"
  when "divide", "/"
    while num2 == 0
      puts "Sorry, the calculator can't divide by 0."
      puts "Please chose another equation or quit."
      break
    end
    puts "#{num1} / #{num2} = #{divide(num1,num2)}"
  when "power of","^", "exponent"
    puts "#{num1} ^ #{num2} = #{exponent(num1,num2)}"
  when "remainder", "%"
    puts "#{num1} % #{num2} = #{mod(num1,num2)}"
  end

  #  handles quit program process
  print "Would you like to try another calulation? (y/n) "
  quit_input = gets.chomp.downcase

  case quit_input
  when "y", "yes", "yep", "yea"
    quit = false
  when "n", "nope", "nah"
    print "Thank you for using the calculator program! Good bye."
    quit = true
  else
    while !["y", "yes", "yep", "yea", "n", "nope", "nah"].include?(quit_input)
      print "Would you like to try another calulation? (y/n) "
      quit_input = gets.chomp.downcase
    end
  end

end
