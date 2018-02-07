require 'set'
operators = ["add", "subtract", "multiply", "divide", "modulo"]

def validate(string)
  case string
  when /\D/
    # Check to see if operators were used
    values = string.split(" ")
    check = values.to_set.intersect?(operators.to_set)
    if check == false
      puts "Please use add, subtract, multiply, divide or modulo or the corresponding symbols"
      string = gets.chomp
    else

    end
    # checks for mathmatical operators, and calculates outright
  when /\p{Sm}/
    result = eval((string))
    
  else
  end
end
puts "Enter maths: "
input = gets.chomp
# result = eval((input))
validate(input)
