puts "Welcome to the calculator"
puts

puts "The calculator can add,subtract,divide and multiply."

puts "Please select your choice "

choice = gets.chomp
if choice == "add" || choice == "+"
  puts "You chose addition"
elsif
  choice == "subtract" || choice == "-"
  puts "You chose subtraction"
elsif
  choice == "multiply" || choice == "*"
  puts " You chose multiplication"
elsif
  choice == "divide" || choice == "/"
  puts "You chose division"
else
  puts " Calculator does not accept that input."
end

puts "Please give me your first number"
first_num = gets.to_f
puts "Please give me your second number"
second_num = gets.to_f


if (choice == "add" || choice == "+")
  total_add = first_num + second_num
  puts total_add
elsif (choice == "subtract" || choice == "-")
  total_subtract = first_num - second_num
  puts total_subtract
elsif (choice == "multiply" || choice == "*")
  total_multiply = first_num * second_num
  puts total_multiply
elsif (choice == "divide" || choice == "/")
  total_divided = first_num / second_num
  puts total_divided
end
