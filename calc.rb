class Object
  def is_number?
    self.to_f.to_s == self.to_s || self.to_i.to_s == self.to_s
  end
end

puts "Welcome to the okayest calculator ever!"

puts "Are we using floats or integers today?"
num_class = gets.chomp.downcase

num_options = ["integer", "integers", "float", "floats"]

until num_options.include?(num_class)
  print "Was that a float or integer? "
  num_class = gets.chomp.downcase
end

print "Please enter an operation: "
user_operation = gets.chomp.downcase

operations = ["add", "+", "subtract", "-", "multiply", "*", "divide", "/",
"^", "exponent", "**", "%", "modulo"]

until operations.include?(user_operation)
  print "Please enter valid operation, remember-this calculator is only okay: "
  user_operator = gets.chomp.downcase
end

print "Please enter the first number of your problem: "
num1 = gets.chomp
  until num1.is_number?
    print "Please enter a number, remember-this calculator is only okay: "
    num1 = gets.chomp
  end

  if num1.include?(".")
    num1 = num1.to_f
  else
    num1 = num1.to_i
  end

print "Please enter the second number of your problem: "
num2 = gets.chomp
  until num2.is_number?
    print "Please enter a number, remember-this calculator is only okay: "
    num2 = gets.chomp
  end

  if num2.include?(".")
    num2 = num2.to_f
  else
    num2 = num2.to_i
  end


case user_operation
  when "add" , "+"
    puts "#{num1} + #{num2} = #{num1 + num2}"
  when  "subtract" , "-"
    puts "#{num1} - #{num2} = #{num1 - num2}"
  when "multiply" , "*"
    puts "#{num1} * #{num2} = #{num1 * num2}"
  when "divide" , "/"
    if num2 == 0
      puts "Cannot divide by 0"
    else
      puts "#{num1} / #{num2} = #{num1 / num2}"
    end
  when "^" , "exponent" , "**"
    puts "#{num1} ^ #{num2} = #{num1 ** num2}"
  when "%" , "modulo"
    puts "#{num1} % #{num2} = #{num1 % num2}"
end
