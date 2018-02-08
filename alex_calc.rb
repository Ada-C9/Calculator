### Calculator program ###

operators_list = %w(add + subtract - multiply * divide /)

# methods
def validate_operator(operator, operators_list)
  until operators_list.include?(operator)
    print "Please enter an operator word or symbol (i.e. add, +, *): "
    operator = gets.chomp
  end
  return operator
end

def validate_num(num)
  while num =~ /[[:alpha:]]/
    print "Please enter a number (i.e. 1, 50, 100): "
    num = gets.chomp
  end
  num = num.to_i
  return num
end

def addition(x, y)
  add_answer = x + y
  puts "#{x} + #{y} = #{add_answer}"
  return add_answer
end

def subtraction(x, y)
  sub_answer = x - y
  puts "#{x} - #{y} = #{sub_answer}"
  return sub_answer
end

def multiplication(x, y)
  mult_answer = x * y
  puts "#{x} * #{y} = #{mult_answer}"
  return mult_answer
end

def division(x, y)
  div_answer = x / y
  puts "#{x} / #{y} = #{div_answer}"
  return div_answer
end

def operation(operator, first_num, second_num)
  case operator
  when "add", "+"
    return addition(first_num, second_num)
  when "subtract", "-"
    return subtraction(first_num, second_num)
  when "multiply", "*"
    return multiplication(first_num, second_num)
  when "divide", "/"
    if second_num == 0
      puts "Undefined: cannot divide by 0"
    else
      return division(first_num, second_num)
    end
  end
end

# prompts and inputs
puts "This is a simple calculator program...\n"
print "\nEnter an operator: "
operator = gets.chomp
validate_operator(operator, operators_list)

print "Enter a number: "
first_num = gets.chomp
first_num = validate_num(first_num)

print "Enter another number: "
second_num = gets.chomp
second_num = validate_num(second_num)

puts
operation(operator, first_num, second_num)
