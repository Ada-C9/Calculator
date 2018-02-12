# Kirsten Schumy
# Ada[9], Ampers
# Week 1: Calculator
# February 8, 2018
#
# This program prompts the user for an equation and prints the solution.


# This program takes in operation and number characters and returns all the
# stored characters
class EquationBuilder
  # Creates a new EquationBuilder
  def initialize
      @new_number = ""  # stores incomplete number characters
      @new_operator = ""  # stores incomplete operation characters
      @equation_array = []  # stores each complete number and operation
  end

  # Pre: provided char must be a non-empty String of size one and must be one of
  # the following: 0123456789+-/^*%.()adsubtrcmulipyvowe. Otherwise, throws
  # ArgumentError.
  #
  # Processes char according to its type (either number character or an
  # operations character)
  def add_char(char)
    has_num_char(char) ? process_number(char) : process_operator(char.downcase)
    # add_new_char(char.downcase)
  end

  # Returns 'true' if possible_char is a number character or an operations
  # character, as defined above
  def has_allowable_character(possible_char)
    return allowable_chars.include?(possible_char.downcase)
  end

  # Ensures all the previously provided number and operation characters are
  # possessed and returns all of the characters
  def get_equation_array
    return return_final_equation_array
  end

  private

  # Adds @new_number and @new_operator if either are not empty, and returns
  # @equation_array
  def return_final_equation_array
    push_new_operation_to_equation_if_not_empty
    push_new_number_to_equation_if_not_empty
    return @equation_array
  end

  # Return the allowable characters: 0123456789+-/^*%.()adsubtrcmulipyvowe
  def allowable_chars
    return "0123456789+-/^*%.()#{allowable_letter_chars}"
  end

  # Returns the allowable letter characters: adsubtrcmulipyvowe
  def allowable_letter_chars
    return "adsubtrcmulipyvowe"
  end

  # Returns 'true' if provided char is a number 0-9, a decimal, or a '-' that
  # functions as a negative sign. Otherwise, returns 'false'.
  def has_num_char(char)
    return char.match?(/[0-9\.]/) || (char.match?(/\-/) &&
      @new_number.empty? && @equation_array.last != ")")
  end

  # Adds @new_operator to @equation_array if @new_operator is not empty and
  # adds provided char to @new_number.
  def process_number(char)
    push_new_operation_to_equation_if_not_empty
    @new_number = "#{@new_number}#{char}"
  end

  # Adds @new_number to @equation_array if @new_numberis not empty and
  # adds provided char to @new_operator.
  def process_operator(char)
    push_new_number_to_equation_if_not_empty
    if !allowable_letter_chars.include?(char) # if not part of a word operator
      push_new_operation_to_equation_if_not_empty
      @new_operator = char
      push_new_operation_to_equation_if_not_empty
    else  # part of a word operator so continue building
      @new_operator = "#{@new_operator}#{char}"
    end
  end

  # If @new_operator is not empty, adds the completed operator to
  # @equation_array and clears @new_operator.
  def push_new_operation_to_equation_if_not_empty
    return if @new_operator.empty?
    converted_new_operator = get_converted_operator
    @equation_array.push(converted_new_operator)
    @new_operator = "" # reset for next operator
  end

  # If the last char the program processed was a '*' and the current char
  # calls for another '*', the program interprets the last and current char as
  # "**". Return either '*' or '**' accordingly.
  def get_multiply_or_exponent
    @equation_array.last == "*" ? (return "*#{@equation_array.pop}") :
      (return "*")
  end

  # Pre: throws ArgumentError if @new_operator is an invalid operation.
  #
  # Returns the converted complete @new_operator
  def get_converted_operator
    case @new_operator
    when "add", "plus", "+"
      return "+"
    when "subtract", "minus", "-"
      return "-"
    when "multiply","times", "*"
      return get_multiply_or_exponent
    when "divide", "/"
      return "/"
    when "mod", "%"
      return "%"
    when "power", "^"
      return "**"
    when "(", ")"
      return @new_operator
    else
      # If this error is thrown, it should be because the client either:
      #   a) provided a valid operations letter character, but the character
      #      combined with other valid letters in a way that produced an invalid
      #      operation, or
      #   b) did not check the character before adding it.
      raise ArgumentError.new("🤖Invalid calculator operation: #{@new_operator}")
    end
  end

  # If @new_number contains a decimal, returns @new_number as a rational number.
  # Otherwise returns @new_number as an int.
  def get_new_number_as_rational_or_int
    @new_number.include?(".") ? (return@new_number.to_r) :
      (return @new_number.to_i)
  end

  # If @new_number is not empty, adds the completed number to
  # @equation_array and clears @new_number.
  def push_new_number_to_equation_if_not_empty
    return if @new_number.empty? # still building
    @equation_array.push(get_new_number_as_rational_or_int)
    @new_number = "" # reset for next operator
  end

end

###############################################################################

# Provided num_one and provided num_two must be rational numbers or ints.
# Returns the sum of num_one and num_two.
def add(num_one, num_two)
  return num_one + num_two
end

# Provided num_one and provided num_two must be rational numbers or ints.
# Returns the difference between num_one and num_two.
def subtract(num_one, num_two)
  return num_one - num_two
end

# Provided num_one and provided num_two must be rational numbers or ints.
# Returns the product of num_one and num_two.
def multiply(num_one, num_two)
  return num_one * num_two
end

# Pre: num_two must not be zero; otherwise prints message and exits program.
#
# Provided num_one and provided num_two must be rational numbers or ints.
# Returns the quotient of num_one and num_two.
def divide(num_one, num_two)
  if num_two == 0
    puts "😱 Can't divide by 0! 😵"
    exit
  end
  return num_one / num_two
end

# Provided num_one and provided num_two must be rational numbers or ints.
# Returns the remainder of num_one divided by num_two.
def mod(num_one, num_two)
  return num_one % num_two
end

# Provided num_one and provided num_two must be rational numbers or ints.
# Returns the num_one the the num_two power.
def power(num_one, num_two)
  return num_one ** num_two
end

# Provided equation does not have numbers on either side of the operator,
# prints message about provided equation being broken and then quits program.
def check_if_invalid_equation(equation)
  equation.each_index do |index|
    next if index == 1  # 1 is the operator
    if equation[index] == String
      puts "#{equation[index]} is not valid!"
      equation_broken(equation)
    end
  end
end

# Pre: program must quit.
#
# Prints message about provided equation being broken and then quits.
def equation_broken(equation)
  puts "☠️  Something broke with #{equation} 🤷"
  exit
end

# Pre: provided equation must have numbers on either side of the operator;
# otherwise, prints message about provided equation being broken and then
# quits program.
#   Example -
#     no error:    equation = [num_one, 'operator', num_two]
#     error:       equation = [num_one, 'operator', 'other operator']
#
# Evaluates provided equation and returns results
def calculate(equation)
  check_if_invalid_equation(equation)
  num_one, operator, num_two = equation
  case operator
  when "+"
    return add(num_one, num_two)
  when "-"
    return subtract(num_one, num_two)
  when "*"
    return multiply(num_one, num_two)
  when "/"
    return divide(num_one, num_two)
  when "%"
    return mod(num_one, num_two)
  when "**"
    return power(num_one, num_two)
  else
    equation_broken(equation) # error and will quit
  end
end

# Prompts user for equation and returns response
def get_initial_equation()
  print "Please enter an equation > "
  return gets.chomp
end

# If provided equation_string contains an invalid character, prompts user to
# enter a new equation until the user provides and equation that does not
# contain an invalid character.
#
# Returns the number and operations characters from provided equation_string.
def get_equation_array(equation_string)
  build_equation = EquationBuilder.new
  equation_string.each_char do |char|
    # char must be one of the following:  0123456789+-/^*%.()adsubtrcmulipyvowe
    # If build_equation only checks for invalid characters and does NOT check
    # for invalid equations.
    if !build_equation.has_allowable_character(char)
      puts "👎 #{char} is not allowed! 🙅\n\n"
      return []
    end
    build_equation.add_char(char)
  end
  return build_equation.get_equation_array
end

# Prints results
def print_results(original_string, equation_array, has_rational)
  print "#{original_string} = "
  has_rational ? (puts equation_array.to_f) : (puts equation_array.to_i)
end

# Returns 'true' if provided next_char is a match to one of the provided
# operators
def has_operator_as_next_char(next_char, operators)
  return next_char.class == String && next_char.match(operators)
end

# Solves provided equation_array and return solution
def do_math(equation_array, operators)
  return equation_array if !equation_array.any?(operators) ||
    equation_array.length < 3
  equation_array.each_index do |index|
    if has_operator_as_next_char(equation_array[index + 1], operators)
      equation_array.insert(index, calculate(equation_array.slice!(index, 3)))
      return do_math(equation_array, operators)
    end
  end
end

# Solves provided equation_array and return solution
def do_all_the_math(equation_array)
  [/\^/, /[*\/%]/, /[\+\-]/].each do |operations_group|
    equation_array = do_math(equation_array, operations_group)
  end
  return equation_array.pop if equation_array.length == 1
  equation_broken(equation_array)
end

# Solves provided equation_array and return solution
def solve_sub_array(equation_array, index)
  length_until_close_parens = equation_array.rindex(")") - index - 1
  sub_equation = equation_array.slice!(index + 1, length_until_close_parens)
  return solve(sub_equation)
end

# Solves provided equation_array and return solution
def solve(equation_array)
  if !equation_array.any?("(")
    return do_all_the_math(equation_array)
  end
  equation_array.each_index do |index|
    if equation_array[index] == "("
      equation_array[index] = solve_sub_array(equation_array, index)
      equation_array.delete_at(index + 1) # deletes ')'
      return solve(equation_array)
    end
  end
end

# ------------------------------------------------------ main
original_input_string = ""
equation_array = []
while equation_array.empty?
  original_input_string = get_initial_equation()
  equation_array = get_equation_array(original_input_string.gsub(/\s/,""))
end

has_rational = equation_array.any? { |part| part.class == Rational }

equation_array = solve(equation_array)

print_results(original_input_string, equation_array, has_rational)
