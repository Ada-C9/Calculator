# Lily's calculator exercise

# ------------------- methods -------------------
def add_nums(one, two)
  return one + two
end

def sub_nums(one, two)
  return one - two
end

def mult_nums(one, two)
  return one * two
end

def div_nums(one, two)
  return one / two
end


# Request calculation from user

puts "Hello! It is is time to calculate."
print "Please enter an operation: "
  calculation = gets.chomp.downcase

until ["add", "+", "addition", "subtract", "-", "subtraction", "multiply", "+", "multiplication", "divide", "/", "division"].include?(calculation)
  print "Please enter a valid operation: "
  calculation = gets.chomp.downcase
end

# Request format from user

print "Please specify whether you'd like to use integers or floats: "
  type = gets.chomp.downcase

until ["float", "floats", "integer", "integers"].include?(type)
 print "Please enter a valid type: "
 type = gets.chomp.downcase
end

# Request numbers from user, storing them accordingly

if type == "integer" || type == "integers"
  print "Please enter number 1: "
  num_one = gets.chomp.to_i
  print "And number 2: "
  num_two = gets.chomp.to_i
elsif type == "float" || type == "floats"
  print "Please enter number 1: "
  num_one = gets.chomp.to_f
  print "And number 2: "
  num_two = gets.chomp.to_f

end

puts num_one
puts num_two

# Calculate

case calculation
  when "add", "+", "addition"
    print "Your answer is: "
    result = add_nums(num_one, num_two)
    puts result
  when "subtract", "-", "subtraction"
    print "Your answer is: "
    result = sub_nums(num_one, num_two)
    puts result
  when "multiply", "+", "multiplication"
    print "Your answer is: "
    result = mult_nums(num_one, num_two)
    puts result
  when "divide", "/", "division"
    if num_two == 0 || num_two == 0.0
      print "ERROR."
    else
      print "Your answer is: "
      result = div_nums(num_one, num_two)
      puts result
    end
  end
