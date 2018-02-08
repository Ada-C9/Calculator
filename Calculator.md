# Brittany Jones
# Ada Calculator
# Last Edited 2/7/18
# The program should ask the user for an operation (string or numeric symbol) and two numbers.

#Primary Requirements
#The program should use the input operation and two numbers to provide the result of applying the operation to the two numbers.
#The program should have support for these four operations: addition, subtraction, multiplication, and division.
#The program should accept both the name (add) and the symbol (+) for each possible operation.


# Prompt user.
puts "Let us do math!"

# Get first number from user.
puts "\nEnter the the first number:"
a = gets.chomp
while true
    if a.to_f.to_s == a || a.to_i.to_s == a
        break
    else
        print "Please enter a valid number:"
        a = gets.chomp
    end
end

# Get the operation they want to use.
puts "Now enter your favorite operator:"
op = gets.chomp

# Get another number from the user.
puts "Give me another number:"
b = gets.chomp
while true
    if b.to_f.to_s == b || b.to_i.to_s == b
        break
    else
        print "Please enter a valid number:"
        b = gets.chomp
    end
end
# While loop, if input goes from integer to string and it is still == to c, then it is a number.
# To validate if user inputs are valid numbers? (Not sure if this part is needed anymore.)
def valid_num(num)
  num == "0" || num.to_i != 0
end

def dec_num(num)
  num.include?(".")
end
##### NOT SURE IF THIS SECTION IS NEEDED AT ALL, ESPECIALLY IF I HAVE CONVERTED THE USER INPUT INTO FLOAT/Integer.#####
# change data types of number to float to account for decimal numbers.
def num_class(i)
  if dec_num (i)
    i.to_f
  else
    i.to_i
  end
end
####### End of some unworthy code ######

def domath(a, op, b)
  if valid_num(a) && valid_num(b)
    a = num_class(a)
    b = num_class(b)
#### End of unworthy code which depend upon the previously written uworthy code####
# Case Loop
ans_wer = case op
    when '+' , 'add'
      a + b
    when '-' , 'subtract'
      a - b
    when ' * ' , 'multiply'
      a * b
    when '/', 'divide'
# What to do when user tries to use division by 0
      if b != 0
        a / b
      else puts "Please enter a number other than '0' when using division"
      end
#Add support for the modulo operator (10 % 3 = 1).
    when '%' , 'modulo'
      a % b
#Add support for computing exponents (2^4 = 2 * 2 * 2 * 2 = 16)
    when ' ** ' , 'exponents'
      a ** b
    else
# If they enter some kind of operator that isnt supported.
      puts "Sorry, this calculator only does calculations with +, -, %, /, * , and exponents. Please enter your favorite operator:"
      op = gets.chomp
    end
# print it out when def method domath
  puts "\nLet there be math!"
  puts "#{a} #{op} #{b} = #{ans_wer}"
  end
end

#Print out the formula in addition to the result, i.e. 2 + 2 = 4
domath(a, op ,b)
