def add(num1, num2)
  num1 + num2
end

def subtract(num1, num2)
  num1 - num2
end

def divide(num1, num2)
  if num2 != 0
    num1 / num2
  else
    puts "What are you doing? You can't divide by zero!"
    return nil
  end
end

def multiply(num1, num2)
  num1 * num2
end

def verify(input)
  input = gets.chomp
  case input 
  when "0"
    input.to_i
  when /\d/
    input.to_i
  else
    puts "Please enter a number: "
    verify(input)
  end
end

answer = "yes"
until answer == "no"
  puts "-" * 20
  puts "Calculator"
  
  puts "Enter a number: "
  num1 = verify(num1)
  
  puts "Enter a second number: "
  num2 = verify(num2)
  
  puts "Input an operator. \n(for a list of operators press enter)"
  operator = gets.chomp
  case operator
  when ""
    puts "Available operators: +, -, *, / or add, subtract, divide, multiply"
    puts "\nInput an operator"
  when "+", "add"
    puts "-" * 20
    puts add(num1, num2)
  when "-", "subtract"
    puts "-" * 20
    puts subtract(num1, num2)
  when "/", "divide"
    puts "-" * 20
    puts divide(num1, num2)
  when "*", "multiply"
    puts "-" * 20
    puts multiply(num1, num2)
  else
    "I'm sorry, I can't calculate that!"
  end
  
  puts ""
  puts "Would you like to calculate something else?"
  answer = gets.chomp.downcase
end  
