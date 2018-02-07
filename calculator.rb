puts "Thank you for choosing my calculator"
answer = 0

def add
  puts "Please enter your first number"
  num1 = gets.chomp.to_f
  puts "Please enter your second number"
  num2 = gets.chomp.to_f
  answer = num1 + num2
  puts "The answer is #{answer}"
end

def subtract
  puts "Please enter your first number"
  num1 = gets.chomp.to_f
  puts "Please enter your second number"
  num2 = gets.chomp.to_f
  answer = num1 - num2
  puts "The answer is #{answer}"
end

def multiply
  puts "Please enter your first number"
  num1 = gets.chomp.to_f
  puts "Please enter your second number"
  num2 = gets.chomp.to_f
  answer = num1 * num2
  puts "The answer is #{answer}"
end

def divide
  puts "Please enter your first number"
  num1 = gets.chomp.to_f
  puts "Please enter your second number"
  num2 = gets.chomp.to_f
  answer = num1 / num2
  puts "The answer is #{answer}"
end

puts "Please choose 'ADD' 'SUBTRACT' 'MULTIPLY' or 'DIVIDE'"
symbol = gets.chomp

if symbol == "ADD" || symbol == "add" || symbol == "+" then
  add
end

if symbol == "SUBTRACT" || symbol == "subtract" || symbol == "-" then
  add
end

if symbol == "MULTIPLY" || symbol == "multiply" || symbol == "*" then
  add
end

if symbol == "DIVIDE" || symbol == "divide" || symbol == "/" then
  add
end
