# The program adds numbers with both add and +
# The program subtracts numbers with both subtract and -
# The program adds numbers with both multiply and *
# The program adds numbers with both divide and /
# The program handles divide when attempting to divide by zero.
# The program handles erroneous input. For example the user might enter clown when asked to enter a number.
# The program also needs to handle erroneous operators.

# Print out the formula in addition to the result, i.e. 2 + 2 = 4
# Make your program know when it needs to return an integer versus a float.
# Add support for computing exponents (2^4 = 2 * 2 * 2 * 2 = 16).

# method created to check user input, if it has decimal store as float
def number
    number = number.to_s
    if number.includes?('.')
        number = number.to_f
    else
        number = number.to_i
    end
end

def add(num1, num2)
    # methods are called on objects
    result = num1 + num2

    return result

    #if num1
    # if the user input is a float, then return answer as a float
    # the user input is stored as integer, even if it's a Float
    # if decimal, convert num input to fload
    # if num1.class == "Float" || num2.class == "Float"
    #     return "result as float #{result.to_f}"
    # else
    #     puts num1.class
    #     return "result as integer #{result}"
    #
    # end

end

def subtract(num1, num2)
    return num1 - num2
end

def multiply(num1, num2)
    return num1 * num2
end

def divide(num1, num2)
    if num2 == 0
        puts "Can't divide by zero! Buh bye. \n\n"
    end

    answer = num1 / num2 # the variable named answer is set to num1 divided by num2

    return answer

end

puts "Welcome to the handy dandy calculator!"
puts "What type of calculation would you like to do? > "

calculation = gets.chomp.downcase

puts "What numbers do you wish to '#{calculation}'?"
user_num1 = gets.chomp.to_i
user_num2 = gets.chomp.to_i


case calculation
when  "+", "add", "addition"
    result = add(user_num1,user_num2)
    puts "#{user_num1} + #{user_num2} = #{result}"

when "-", "subtraction", "subtract"
    result = subtract(user_num1,user_num2)
    puts "#{user_num1} - #{user_num2} =  #{result}"

when "*", "multiply", "multiplication"
    result = multiply(user_num1,user_num1)
    puts "#{user_num1} * #{user_num2} =  #{result}"

when "/", "divide", "division"
    result = divide(user_num1, user_num2)
    puts "#{user_num1} / #{user_num2} = #{result}"

else
    puts "Give me something I can work with! Please start over"
    calculation = gets.chomp.downcase
end
