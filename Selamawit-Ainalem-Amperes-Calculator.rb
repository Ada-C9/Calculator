@MAX_AMOUNT_OF_ATTEMPTS = 2

def collect_user_info()
  operations = { 'add' => '+',
                'subtract' => '-',
                'divide' => '/',
                'multiply' => '*',
                'exponent' => '^',
                'modulo'  => '%'
                }

  puts "\nHello! Welcome to Ada calculator!"
  puts "Enter two numbers you'd like to calculate.\n\n"

  print "Number 1: "
  num1 = gets.chomp
  num1 = confirm_integer(num1)

  print "Number 2: "
  num2 = gets.chomp
  num2 = confirm_integer(num2)

  print "Enter an operation(+,-,/,*,%,^): "
  user_operation = gets.chomp
  count = 0

  while operations[user_operation] == nil && operations.invert[user_operation] == nil
    if count > @MAX_AMOUNT_OF_ATTEMPTS
      puts "Maximum amount of attempts have been exceeded. Default -add- operation has been selected."
      user_operation = 'add'
      break
      #is there a better way to write these loops to exit without a break?
    end
    puts "Sorry, not a valid entry, try again."
    print "Operation: "
    user_operation = gets.chomp
    count+=1
  end

  if user_operation == 'add' || user_operation == '+'
    puts add(num1,num2)
  elsif user_operation == 'subtract' || user_operation == '-'
    puts subtract(num1,num2)
  elsif user_operation == 'divide' || user_operation == '/'
    puts divide(num1,num2)
  elsif user_operation == 'multiply' || user_operation == '*'
   puts multiply(num1,num2)
 elsif user_operation == 'exponent' || user_operation == '^'
   puts exponents(num1,num2)
 elsif user_operation == 'modulo' || user_operation == '%'
   puts modulo(num1,num2)
  end
end

def confirm_integer(a_number)
  number_attempts = 0
  while a_number.to_f.to_s != a_number && a_number.to_i.to_s != a_number
    puts "You have #{@MAX_AMOUNT_OF_ATTEMPTS-number_attempts+1} number of attempts, please re-enter a number"
    print "New number: "
    a_number = gets.chomp
    if number_attempts > @MAX_AMOUNT_OF_ATTEMPTS
      puts "You have exceeded the allowed number of attempts, the default number 5 has been selected."
      a_number = 5
      break
    end
    number_attempts +=1
  end
  return a_number.to_f
end

def add(num1,num2)
  return "#{num1} + #{num2} = #{num1+num2.round(2)}"
end

def subtract(num1,num2)
  puts "\nEnter A for: #{num1}-#{num2}"
  print "Enter B for: #{num2}-#{num1}\n"
  print "Selection: "
  subtract_choice = gets.chomp.upcase
  count = 0
  while subtract_choice != 'A' && subtract_choice !='B'
    if count > @MAX_AMOUNT_OF_ATTEMPTS
      puts "You have exceeded maximum amount of entries. Default selection (A) has been made."
      subtract_choice = 'A'
      break
    end
    puts "You have #{(@MAX_AMOUNT_OF_ATTEMPTS - count)+1} attempts please re-enter a valid menu option.}"
    print "Menu option: "
    subtract_choice = gets.chomp
    count+=1
  end
  if subtract_choice == 'A'
    subtract_value = "#{num1} - #{num2} = #{num1 - num2}"
  else
    subtract_value = "#{num2} - #{num1} = #{num2 - num1}"
  end
  return subtract_value
end

def multiply(num1,num2)
  return "#{num1} * #{num2} = #{num1*num2.round(2)}"
end

def divide(num1,num2)
  puts "\nEnter A for: #{num1}/#{num2}"
  puts "Enter B for: #{num2}/#{num1}\n"
  print "Selection: "
  divide_choice = gets.chomp.upcase
  count = 0
  while divide_choice != 'A' && divide_choice !='B'
    if count > @MAX_AMOUNT_OF_ATTEMPTS
      puts "You have exceeded maximum amount of attempts. Default value (A) has been selected."
      divide_choice = 'A'
      break
    end
    puts "You have #{@MAX_AMOUNT_OF_ATTEMPTS-count+1} attempts remaining please enter a valid menu option."
    print "Menu choice: "
    divide_choice = gets.chomp.upcase
    count+=1
  end
  if divide_choice == 'A'
    while num2 == 0
      puts "Can't divide by 0, try again"
      print "Re-enter number 2: "
      num2 = gets.chomp
      num2 = confirm_integer(num2)
    end
    divide_value = "#{num1}/#{num2} = #{(num1/num2).round(2)}"
  else
    while num1 == 0
      puts "Can't divide by 0, try again"
      print "Re-enter number 1: "
      num1 = gets.chomp
      num1 = confirm_integer(num1)
    end
    divide_value = "#{num1}/#{num2} = #{(num2/num1).round(2)}"
  end
  return divide_value
end

def exponents(num1, num2)
  puts "\nEnter A for: #{num1} base case"
  puts "Enter B for: #{num2} base case\n"
  print "Selection: "
  exponent_choice = gets.chomp.upcase
  count = 0
  while exponent_choice != 'A' && exponent_choice !='B'
    if count > @MAX_AMOUNT_OF_ATTEMPTS
      puts "You have exceeded the maximum number of attempts. Default choice (A) is selected."
      exponent_choice = 'A'
    end
    print "Enter a valid menu option"
    exponent_choice = gets.chomp.upcase
    count+=1
  end
  if exponent_choice == 'A'
    exponent_value = "#{num1}^#{num2} = #{num1}"
    (num2.to_i-1).times do
      exponent_value.concat(" * #{num1}")
    end
     exponent_value.concat(" = #{num1**num2}")
  else
    exponent_value = "#{num2}^#{num1} = #{num2}"
    (num2.to_i-1).times do
      exponent_value.concat(" * #{num2}")
  end
    exponent_value.concat(" = #{num2**num1}")
  end
end

def modulo(num1,num2)
  puts "\nEnter A for: #{num1} % #{num2}"
  puts "Enter B for: #{num2}  % #{num1}\n"
  print "Selection: "
  modulo_choice = gets.chomp.upcase
  count = 0
  while modulo_choice != 'A' && modulo_choice !='B'
    if count > @MAX_AMOUNT_OF_ATTEMPTS
      puts "You have exceeded the maximum number of attempts default choice (A) is selected."
      modulo_choice = 'A'
      break
    end
    puts "You have #{@MAX_AMOUNT_OF_ATTEMPTS-count+1} attempts remaining to enter valid attempts."
    print "Menu option: "
    modulo_choice = gets.chomp.upcase
    count+=1
  end
  if modulo_choice == 'A'
    mod_val = "#{num1} % #{num2} = #{num1%num2}"
  else
    mod_val = "#{num2} % #{num1} = #{num2%num1}"
  end
    return mod_val
  end

collect_user_info()
