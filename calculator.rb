
def border
  puts "-------------------------------"
end
border
border

# Welcomes User
puts "Welcome! I will help you calculate simple math\n"

# Gives user directions for input
puts "\n INPUT DIRECTIONS: "
puts "** Separate all values and symbols."
puts "** Enter two numbers at a time"
puts "** Use format: number operator number"
puts "** Enter operators as symbols or names"
puts " Use:\n"
puts "+   add"
puts "-   subtract"
puts "*   multiply"
puts "/   divide\n"

# Arrays storing past equations, issues with user input, and current equation being calculated
solved_equations = []
points_of_confusion = []
equation = []

# Variables used to store total for solved equation and initiate while loop
total = 0
response = "y"

# Evaluates user response for float, integer, word
def float_or_integer value
  if value.to_f.to_s == value
    value = value.to_f
  elsif value.to_i.to_s == value
    value = value.to_i
  else
    value = false
  end
  return value
end

while response == "y"
  puts "\nPlease enter your equation."
  user_entry = gets.chomp.downcase.split(" ")

  numbers = [user_entry[0], user_entry[2]]
  numbers.each do |num|
    if float_or_integer(num) == false && num != nil
      points_of_confusion.push("I am unsure of the meaning of #{num}.")
    elsif num == nil
      points_of_confusion.push("Missing a number")
    else
      equation.push(float_or_integer(num))
    end
  end

  operator = user_entry[1]
  case operator
  when "add", "+"
    total = equation[0] + equation [1]
  when "subtract", "-"
    total = equation[0] - equation [1]
  when "multiply", "*"
    total = equation[0] * equation [1]
  when "divide", "/"
    if equation[1].to_i != 0
      total = equation[0] / equation [1]
    else
      points_of_confusion.push("You cannot divide by 0.")
    end
  else
    points_of_confusion.push("I am unsure of the meaning of #{operator}.")
  end

  if points_of_confusion.length > 0
    puts "I was unable to solve your equation because:"
    points_of_confusion.each {|issue| puts issue}
    puts "\n"
  else
    solved_equation = "#{user_entry.join(" ")} = #{total}"
    puts solved_equation
    solved_equations.push(solved_equation)
  end
  equation.clear
  points_of_confusion.clear
  puts "\n"
  border
  puts "Type y to compute more equations. Type anything else to stop adding equations.\n"
  response = gets.chomp.downcase
end

puts "Equations solved:"
solved_equations.each {|equation| puts equation}
puts "\n"
