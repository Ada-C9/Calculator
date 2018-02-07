

# baseline: the program should ask for an operation (string or numeric symbol) and two numbers
puts "Welcome to Anne's CLI-culator!"

num_a = 0
num_b = 0

calculator_functions = ["add or +", "subtract or -", "multiply or *", "divide or /"] # array to print out the functionality currently supported
puts "Please choose from the following operations: "
puts calculator_functions
print "What would you like to do: "
command = gets.chomp.downcase

puts "Great! Let's #{command} two numbers!"
puts "Please enter the first number to #{command}: "
begin #should maybe make this rescue into a method so it can be used on num_b
  num_a = gets.chomp
  num_a = Integer(num_a)
rescue
  print "Please enter an integer: "
  retry
end

puts "Please enter the second number to #{command}: "

begin
  num_b = gets.chomp
  num_b = Integer(num_b)
rescue
  print "Please enter an integer: "
  retry
end

def add(num_a, num_b)
  result = num_a + num_b
  puts "#{num_a} + #{num_b} = #{result}"
end

def subtract(num_a, num_b)
  result = num_a - num_b
  puts "#{num_a} - #{num_b} = #{result}"
end

def multiply(num_a, num_b)
  result = num_a * num_b
  puts "#{num_a} * #{num_b} = #{result}"
end

def divide(num_a, num_b)

  #need to handle not allowing dividing by 0 and retrying; refactor to rescue?
  #also doesn't handle non integer division yet
  if num_b != 0
    result = num_a / num_b
    puts "#{num_a} / #{num_b} = #{result}"
  else
    puts "Not able to divide by 0. Please enter a different divisor: "
    num_b = gets.chomp.to_i
    if num_b != 0
      result = num_a / num_b
      puts "#{num_a} / #{num_b} = #{result}"
    else
      puts "Maybe take a break and come back to this"
      return nil
    end
  end
end

case command
when "add", "+"
  add(num_a, num_b)
when "subtract", "-"
  subtract(num_a, num_b)
when "multiply", "*"
  multiply(num_a, num_b)
when "divide", "/"
  divide(num_a, num_b)
else
  puts "Please create a user story for this functionality. Thanks!"
end

# add(num_a, num_b)
# subtract(num_a, num_b)
# multiply(num_a, num_b)
# divide(num_a, num_b)
