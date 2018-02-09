# calculator program allows user to perform simple operations (+, -, *, /, ^, %) between two operands

# declare methods for each operation
def add(num1, num2)
  return "#{num1} + #{num2} = #{num1 + num2}"
end

def sub(num1, num2)
  return "#{num1} - #{num2} = #{num1 - num2}"
end

def mult(num1, num2)
  return "#{num1} * #{num2} = #{num1 * num2}"
end

def div(num1, num2)
  if num2 == 0
    puts "Please do not divide by zero. You're going to rip a hole in the time-space continuum!"
  else
    return "#{num1} / #{num2} = #{num1 / num2}"
  end
end

def exp(num1, num2)
  expanded_form = ""
  (1...num2).each do
    expanded_form += "#{num1} * "
  end
  expanded_form += "#{num1}"
  return "#{num1} ^ #{num2} = #{expanded_form} = #{num1 ** num2}"
end

def mod(num1, num2)
  return "#{num1} % #{num2} = #{num1 % num2}"
end

# validate number
def val(num)
  # this should cover strings that don't evaluate to numbers as well as nil
  while num.to_i == 0 || num.to_f == 0.0
    if num == "0"
      return num = num.to_i
    elsif num == "0.0"
      return num = num.to_f
    end
    puts "Please enter a recognizable number."
    num = gets.chomp
  end

  if num.include?(".")
    num = num.to_f
  else
    num = num.to_i
  end
  return num

end

# ask user for operation & check if acceptable, if so ask for numbers
puts "Choose the operation you would like: add (+), subtract (-), multiply (*), divide (/), exponent (^), or modulo (%)?"
operation = gets.chomp

case operation
when "add", "+", "subtract", "-", "multiply", "*", "divide", "/", "exponent", "^", "modulo", "%"
  puts "What's the first number?"
  first_num = gets.chomp
  first_num = val(first_num)
  puts "What's the second number?"
  second_num = gets.chomp
  second_num = val(second_num)
else
  puts "I do not recognize that operation."
end

# perform operation based on input
case operation
when "add", "+"
  puts add(first_num, second_num)
when "subtract", "-"
  puts sub(first_num, second_num)
when "multiply", "*"
  puts mult(first_num, second_num)
when "divide", "/"
  puts div(first_num, second_num)
when "exponent", "^"
  puts exp(first_num, second_num)
when "modulo", "%"
  puts mod(first_num, second_num)
end
