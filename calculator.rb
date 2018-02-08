# Calculator Exercise
# Build a calculator command line interface (CLI) that allows a user to perform simple arithmetic.

# Welcome message:
puts "\n"
puts "Welcome to this super basic calculator!"
puts "\n"



# Prompt the user for a operation to be made on the calculator:
print "What operation would you like to do? "
operation = gets.chomp
valid_operations = %w[add + addition subtract - subtraction multiply *
  multiplication divide division / modulo % exponential ^]
  while !(valid_operations.include?(operation))
    puts "Input invalid."
    print "Please enter a basic operation to be made: "
    operation = gets.chomp
  end


  # Prompt the user for the numbers to be used on the calculation:
  puts "\n"
  puts "What are the numbers you would like to perform the operation with?"

  puts "\n"
  print "Number 1: "
  first_num = gets.chomp
  while first_num.match?(/\D/) && !(first_num.match?(/\d\.\d/)) || first_num == ""
    puts "Input invalid. Please enter a number"
    print "Number 1: "
    first_num = gets.chomp
  end
  first_num = first_num.to_f

  puts "\n"
  print "Number 2: "
  second_num = gets.chomp
  while second_num.match?(/\D/) && !(second_num.match?(/\d\./)) || second_num == ""
    puts "Input invalid. Please enter a number"
    print "Number 1: "
    second_num = gets.chomp
  end
  puts "\n"



  # Display Integer or Float:
  print "Would you like to see an integer or a float? "
  type_answer = gets.chomp.downcase
  while !(type_answer == "integer" || type_answer== "i" || type_answer == "float" || type_answer == "f")
    puts "Invalid option."
    print "Please choose from INTEGER or FLOAT: "
    type_answer = gets.chomp.downcase
  end
  puts "\n"

  if type_answer == "integer"
    second_num = second_num.to_i
    first_num = first_num.to_i
  else
    second_num = second_num.to_f
    first_num = first_num.to_f
  end



  # Methods for the operations:

  def addition(first_num, second_num)
    formula = "#{first_num} + #{second_num}"
    result = first_num + second_num
    output = [result.round(2), formula]
    return output
  end

  def subtraction(first_num, second_num)
    formula = "#{first_num} - #{second_num}"
    result = first_num - second_num
    output = [result.round(2), formula]
    return output
  end

  def multiplication(first_num, second_num)
    formula = "#{first_num} * #{second_num}"
    result = first_num * second_num
    output = [result.round(2), formula]
    return output
  end

  def division(first_num, second_num)
    formula = "#{first_num} / #{second_num}"
    result = first_num / second_num
    output = [result.round(2), formula]
    return output
  end

  def modulo(first_num, second_num)
    formula = "#{first_num} % #{second_num}"
    result = first_num % second_num
    output = [result.round(2), formula]
    return output
  end

  def exponential(first_num, second_num)
    formula = "#{first_num}^#{second_num}"
    result = first_num ** second_num
    output = [result.round(2), formula]
    return output
  end




  # Conditional + Output

  case operation
  when "add" , "+"
    puts "The formula for this operation is: #{addition(first_num, second_num)[1]}"
    puts "\n"
    puts "The total of this operation is: #{addition(first_num, second_num)[0]}"
  when "subtract" , "-"
    puts "The formula for this operation is: #{subtraction(first_num, second_num)[1]}"
    puts "\n"
    puts "The total of this operation is: #{subtraction(first_num, second_num)[0]}"
  when "multiply", "*"
    puts "The formula for this operation is: #{multiplication(first_num, second_num)[1]}"
    puts "\n"
    puts "The total of this operation is: #{multiplication(first_num, second_num)[0]}"
  when "divide", "/"
    if  second_num == 0
      puts "Cannot perform division with a value <= 0"
    else
      puts "The formula for this operation is: #{division(first_num, second_num)[1]}"
      puts "\n"
      puts "The total of this operation is: #{division(first_num, second_num)[0]}"
    end
  when "modulo", "%"
    puts "The formula for this operation is: #{modulo(first_num, second_num)[1]}"
    puts "\n"
    puts "The total of this operation is: #{modulo(first_num, second_num)[0]}"
  else #(exponents)
    puts "The formula for this operation is: #{exponential(first_num, second_num)[1]}"
    puts "\n"
    puts "The total of this operation is: #{exponential(first_num, second_num)[0]}"
  end
  puts "\n"




  # still needs:
  # Add support for parentheticals, i.e. 10 / (5 + 5) = 1.
