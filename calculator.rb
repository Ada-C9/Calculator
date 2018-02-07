# This is a calculator program
# the user should ask what they would like to calculate.

operations = ["multiply", "divide", "subtract", "exponify",
"modulate", "-", "*", "/", "**", "+", "%"]

puts "\nWelcome to your Calculator Program!"
puts "Enter two numbers and an operation."
puts "Would you like to continue? (yes/no) "
answer = gets.chomp.downcase

while answer == "yes" do
  # first number
  print "\n#1 Number: "
  until (num_1 = gets.chomp) =~ /^\d*\.?\d+$/
    # /^(\d*\.?\d+|\d{1,3}(,\d{3})*(\.\d+)?)$/
    puts "\nInvalid input. Please enter a number: "
  end
  num_1 = num_1.to_f
  # second number
  print "\n#2 Number: "
  until (num_2 = gets.chomp) =~ /^\d*\.?\d+$/
    puts "\nInvalid input. Please enter a number: "
  end
  num_2 = num_2.to_f
  # operation to perform
  print "\nOperation: "
  op = gets.chomp.downcase
  until operations.include?("#{op}")
    print "\nPlease enter an operation
    (add, subtract, multiply, divide, exponify, or modulate): "
    op = gets.chomp.downcase
  end

  # divide
  def divide(num1, num2)
    if num2 != 0

      print "#{num1} / #{num2} = "
      (num1 / num2).round(2)
    else

      puts "Can't divide by zero!"
    end
  end

  # multiply
  def multiply(num1, num2)

    print "#{num1} * #{num2} = "
    (num1 * num2).round(2)
  end

  # subtract
  def subtract(num1, num2)

    print "#{num1} - #{num2} = "
    (num1 - num2).round(2)
  end

  # addition
  def add(num1, num2)

    print "#{num1} + #{num2} = "
    (num1 + num2).round(2)
  end

  # exponify
  def exponify(num1, num2)

    print "#{num1} ^ #{num2} = "
    (num1**num2).round(2)
  end

  # modulo
  def modulate(num1, num2)

    print "#{num1} % #{num2} = "
    (num1%num2).round(2)
  end

# print the result and round numbers by two decimals
  case op
  when "add", "+"
    print add(num_1, num_2)
  when "subtract", "-"
    print subtract(num_1, num_2)
  when "multiply", "*"
    print multiply(num_1, num_2)
  when "divide", "/"
    print divide(num_1, num_2)
  when "exponify", "**"
    print exponify(num_1, num_2)
  when "modulate", "%"
    print modulate(num_1, num_2)
  end
  print "\nWould you like to continue? (yes/no) "
  answer = gets.chomp.downcase
end
