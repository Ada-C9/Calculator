#this method will take in numbers and operator
#from the user, and return the operation as in
#a calculator



#this checks to make sure the user input is an operator
def really_equation(operator)
  special = "-+/%*^"
  regex = /[#{special.gsub(/./){|char| "\\#{char}"}}]/
  if (operator =~ regex && operator.length == 1) || operator == "**"
  else
    until operator =~ regex && operator.length == 1 || operator == "**"
      puts "Please choose an operator from the list +, -, *, /, ^, %"
      operator = gets.chomp.to_s
    end
  end
  return operator
end


#this checks to make sure the user input is a number
def really_numbers(number)
  #checks if number is a float
    if number.to_f % 1 != 0
      number = number.to_f
    elsif !(/\A\d+\z/.match(number))
      puts "Not a positive number"
      puts "Please enter a number."
      number = gets.chomp
      until /\A\d+\z/.match(number)
        puts "Please enter a number."
        number = gets.chomp
      end
      return number.to_i
    elsif /\A\d+\z/.match(number)
      number = number.to_i
    end
    return number
  end


#this checks the user input is correct based
#on what the user wanted to input
def correct (operator, num1, num2)
  puts "Is this correct #{num1}#{operator}#{num2}"
  answer = gets.chomp.to_s.downcase
  if answer.include? ('y')
    puts "Great, let's perform the operation."
    return
  else
    until answer.include? ('y')
      puts "Please input your numbers again."
      puts "Number 1"
      num1 = gets.chomp.to_r
      puts "Number 2"
      num2 = gets.chomp.to_r
      puts "Operator"
      operator = gets.chomp.to_s
      puts "Is this correct #{num1} #{operator} #{num2}"
      operation = "#{num1} #{operator} #{num2}"
      answer = gets.chomp.to_s.downcase

    end
  end
end


#this performs the operation and returns the value of
#said operation
def math(operator, num1, num2)
  case operator
    when "add", "+"
      puts "adding"
      math_answer = num1+num2
    when "subtract", "-"
      math_answer = num1 - num2
    when "divide", "/"
      if num2 == 0
        return "You can't divide by zero, sorry."
      else
        math_answer = num1/num2
      end
    when "multiply", "*"
      math_answer = (num1) * (num2)
    when "exponent", "^"
      math_answer = (num1) ** (num2)
    when "modulo", "%"
      math_answer = num1 % num2
  end
  puts math_answer
end

#this is the body of the code, that performs the methods
puts "Hello and welcome to the Ada C9 Calculator."

puts "Please choose your operator. +, -, *, /, ^, %"
operator = gets.chomp.to_s.strip
operator = really_equation(operator)

puts "Please enter your first number:"
num1 = gets.chomp
num1 = really_numbers(num1)

puts "Please enter your second number:"
num2 = gets.chomp
num2 = really_numbers(num2)


math_answer = 0

correct(operator, num1, num2)
puts "#{num1} #{operator} #{num2}"
math(operator, num1, num2)

puts "Thank you for using the Ada C9 calculator!"
