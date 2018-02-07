def add(num1, num2)
  return num1 + num2
end

def subtract(num1, num2)
  return num1 - num2
end

def multiply(num1, num2)
  return num1 * num2
end

def divide(num1, num2)
  return num1 / num2
end

puts "Hello! Welcome to my Calculator App!"
puts

puts "Please enter a number!"
begin
  num1 = gets.chomp
  num1 = Integer(num1)
rescue
  puts "Please enter a numeric value!"
  retry
end

puts "Please enter an operator! (ex: add, - , divide, +, etc...):"
operator = gets.chomp

while true
  break if operator == "add" || operator == "+" ||operator == "subtract" || operator =="minus" || operator == "-" || operator == "divide" || operator == "/" || operator == "mutliply" || operator == "times" || operator == "*"
  puts "Not a valid operator!"
end
# fix loop

puts "Please enter another number!"
begin
  num2 = gets.chomp
  num2 = Integer(num2)
rescue
  puts "Please enter a numeric value!"
  retry
end

if operator == "add" || operator == "+"
  puts add(num1, num2)
elsif operator == "subtract" || operator =="minus" || operator == "-"
  puts subtract(num1, num2)
elsif operator == "divide" || operator == "/"
  puts divide(num1, num2)
else operator == "mutliply" || operator == "times" || operator == "*"
  puts multiply(num1, num2)

end
