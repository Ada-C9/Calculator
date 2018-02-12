=begin
This is assignment 2 for Ada cohort 9
Assigned:   18-2-06 pm
Due:        18-2-08 am (before class)

Specs:
PROJECT STATEMENT:  A command line interface (CLI) that allows a user to perform basic arithmetic

REQUIREMENTS:       * Solicit the following input from the user:
                      - Operation desired
                          = Choice of addition, subtraction, multiplication, and division
                          = Should handle this input in both symbolic and word form
                      - 2 numbers on which to perform the operation
                    * Perform the operation
                    * Handle predictable, exceptional situations appropriately, including:
                      - Division by zero
                      - Erroneous input, including (but not necessarily limited to)
                          = Non-numerical words
                          = Blank returns

STRETCH GOALS:      * Print out the user's formula before the result
                    * Support exponents (with the caret, and/or in word form)
                        -- NOPE
                    * Support the modulo operation (%)
                        -- NOPE
                    * Appropriately identify the need for a result in integer vs float form,
                      and respond accordingly
                        -- NOPE
                    * EXTREME STRETCH GOAL:  Handle parentheticals
                        -- NOPE

GENERAL PROCESS:     0.   METHODS AND INitiAL DATA
                     I.   INTRODUCTION AND GREETING
                    II.   SOLICIT AND VALIDATE USER INPUT
                   III.   DETERMINE APPROPRIATE OPERATION
                    VI.   PRINT USER FORMULA
                     V.   CALCULATE AND OUTPUT
                    VI.  THANKS AND CLOSE

=end

###### INPUT VALIDATION METHODS AND INitiAL DATA

def reject_blank_input (initial_user_input)
#       FULL DISCLOSURE:  This is recycled, with minor
#       modifications, from the code I wrote for my
#       coding challenge last fall.
  while /^[[:space:]]+[[:alnum:]]{0}\s*$/ =~ initial_user_input
    puts "\n\t\tTHAT ENTRY APPEARS TO BE BLANK.\n\nPlease try again. "
    initial_user_input = gets
  end
  return initial_user_input
end

def check_for_non_numeric_input (nonblank_standardized_number_input)
  if /[[:alpha:]]/ =~ nonblank_standardized_number_input
=begin This regexp is woefully inadequate. It's like this because I was trying (VERY HARD!) to do something
fancy and it Did. Not. Work. Out., so I had to kluge something together at the last minute. If you want
to see what I was trying to do, it's preserved as a comment after the end of the active code.
=end
   puts "\n\nThat was not a recognizable number.\n\nYou must not really want to do math.\n\nThat's ok. I don't either."
    exit
  end
end

def manicure_operation_input (nonblank_operation_input)
  # Note to self: Don't use this for the numbers.
  nonblank_operation_input.chomp!
  nonblank_operation_input.strip!
  nonblank_operation_input.downcase!
  return nonblank_operation_input
end

recognized_operations = {
  "+" => 1,
  "add" => 1,
  "addition" => 1,
  "plus" => 1,
  "sum" => 1,
  "-" => 2,
  "subtract" => 2,
  "subtraction" => 2,
  "minus" => 2,
  "less" => 2,
  "*" => 3,
  "x" => 3,
  "times" => 3,
  "multiply" => 3,
  "multiplication" => 3,
  "product" => 3,
  "/" => 4,
  "divide" => 4,
  "divide by" => 4,
  "divided by" => 4,
  "quotient" => 4,
  "over" => 4
}


### INTRODUCTION AND GREETING

puts "\n\nWelcome to THE PEOPLE'S REPUBLIC OF ARITHMOS!\n\n"
puts "Here, you will be asked to enter two numbers, followed by an arithmetical operation.\nThen, the program will perform the operation on your numbers and give you a result.\n\n
Ready? Great! Let's go!\n\n"

### SOLICIT AND VALIDATE USER INPUT

# Solicit and Validate Numbers

puts "Please enter your first number:\n"
initial_first_number_input = gets
nonblank_first_number = reject_blank_input (initial_first_number_input)
check_for_non_numeric_input (nonblank_first_number)
validated_first_number_input = nonblank_first_number.to_f

puts "Please enter your second number:\n"
initial_second_number_input = gets
nonblank_second_number = reject_blank_input (initial_second_number_input)
check_for_non_numeric_input (nonblank_second_number)
validated_second_number_input = nonblank_second_number.to_f

# Solicit and Validate Operation

puts "What operation would you like to perform?\n"
initial_operation_input = gets.to_s
nonblank_initial_operation_input = reject_blank_input (initial_operation_input)
fully_manicured_operation_input = manicure_operation_input (nonblank_initial_operation_input)
if recognized_operations.has_key?(fully_manicured_operation_input)
  puts "\n\nI like that kind of math! Let's do this!"
else
  puts "\n\nThat kind of math is way beyond me. You may need a specialist."
  exit
end

### PRINT USER'S FORMULA WITH ANSWER
puts "\n\nHere is your answer:\n\n"
if recognized_operations[fully_manicured_operation_input] == 1
  user_answer = validated_first_number_input + validated_second_number_input
  puts "\t\t#{validated_first_number_input} + #{validated_second_number_input} = #{user_answer}"
elsif recognized_operations[fully_manicured_operation_input] == 2
  user_answer = validated_first_number_input - validated_second_number_input
  puts "\t\t#{validated_first_number_input} - #{validated_second_number_input} = #{user_answer}"
elsif recognized_operations[fully_manicured_operation_input] == 3
  user_answer = validated_first_number_input * validated_second_number_input
  puts "\t\t#{validated_first_number_input} * #{validated_second_number_input} = #{user_answer}"
elsif recognized_operations[fully_manicured_operation_input] == 4
  if validated_second_number_input == 0
    puts "Wait.\n\nYou're trying to divide by zero? Seriously?\n\nUh-uh, buddy. Not on my watch."
  else
    user_answer = validated_first_number_input / validated_second_number_input
    puts "\t\t#{validated_first_number_input} / #{validated_second_number_input} = #{user_answer}"
  end
else
  puts "You know, sometimes math just doesn't work out.  I'm sorry. It's not you, it's me."
end

### THANKS AND CLOSE

puts "\n\nThank you for visiting THE PEOPLE'S REPUBLIC OF ARITHMOS.\n\n\n\n\t\t"


=begin

Here's a terrifically bad Regexp fail that I thought was brilliant
and gorgeous until I figured out that it was actually completely
misbegotten and @#$% impossible:

def check_for_non_numeric_input (nonblank_standardized_number_input)
  nondigit_input = nonblank_standardized_number_input.match(/\D/)
  if nondigit_input.length == 0
    validity_of_number_input == valid
  elsif nondigit_input.length == 1
    if /^\-/ =~ nondigit_input
      validity_of_number_input == valid
    elsif /\./ =~ nondigit_input
      validity_of_number_input == valid
    elsif nondigit_input.length == 2
      if /^\-/ =~ nondigit_input
        if /\./ =~ nondigit_input
          validity_of_number_input == valid
      end
    else validity_of_number_input == invalid
    end
  end
  return validity_of_number_input
end

=end
