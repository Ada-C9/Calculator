# Return color strings
require 'colorize'

# Empty string
puts ""
# Use colize to bold and color
puts "CALCULATOR".bold.red.on_white

# Display ascii art
puts "
_____________________
|  _________________  |
| | JO           0. | |
| |_________________| |
|  ___ ___ ___   ___  |
| | 7 | 8 | 9 | | + | |
| |___|___|___| |___| |
| | 4 | 5 | 6 | | - | |
| |___|___|___| |___| |
| | 1 | 2 | 3 | | x | |
| |___|___|___| |___| |
| | . | 0 | = | | / | |
| |___|___|___| |___| |
|_____________________|


".bold

# Prompt user
puts "Enter command: add, +, subtract, -, multiply, *, divide, /, exponify, **, modulo, %.".bold.blue
command = gets.chomp

commands = ["add", "+", "subtract", "-", "multiply", "*", "divide", "/", "exponify", "**", "modulo", "%"]
# Keep on asking user until they put right command
attempts = 0
until commands.include?(command)
  attempts += 1
  if attempts > 2
    exit
  end
  puts "Invalid Entry!".bold.red
  puts "Enter command: add, +, subtract, -, multiply, *, divide, /, exponify, **, modulo, %.".bold.blue
  command = gets.chomp
end

# Method for determining if a number is float or integer
def number_type a
  if a.include?(".")
    return a.to_f.round(2)
  else
    return a.to_i
  end
end

# Method for determining if a number is float or integer
def number_type b
  if b.include?(".")
    return b.to_f.round(2)
  else
    return b.to_i
  end
end

# Until user enters a float or integer it'll keep prompting
puts "Enter first number"
a = gets.chomp
attempts = 0
until a =~ /^[-+]?[0-9]*\.?[0-9]+$/
  attempts += 1
  if attempts > 2
    exit
  end
  puts "Invalid Entry!".bold.red
  puts "Enter first number"
  a = gets.chomp
end
a = number_type a

# Until user enters a float or integer it'll keep prompting
puts "Enter second number"
b = gets.chomp
attempts = 0
until b =~ /^[-+]?[0-9]*\.?[0-9]+$/
  attempts += 1
  if attempts > 2
    exit
  end
  puts "Invalid Entry!".bold.red
  puts "Enter second number"
  b = gets.chomp
end
b = number_type b

# Method to return divide
def divide a, b
  if b == 0
    return "Division by zero is undefined."
  else
    return "a / b = #{a/b}"
  end
end

# Method to display exponify
def display_exponify a, b
  display = "#{a} * " * (b - 1) + "#{a} = " if b > 1
end

# Method to return exponify
def exponify a, b
  return "a ^ b = #{display_exponify a, b}#{a**b}"
end


# Display result based on command user chooses
case command
when "add", "+"
  puts "a + b = #{(a+b).round(2)}"
when "subtract", "-"
  puts "a - b = #{(a-b).round(2)}"
when "multiply", "*"
  puts "a * b = #{(a*b).round(2)}"
when "divide", "/"
  puts divide a, b
when "exponify", "**"
  puts exponify a, b
when "modulo", "%"
  puts "a % b = #{(a%b).round(2)}"
end
