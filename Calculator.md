puts "Lets Do Math!"

puts "Enter the the first number:"
a = gets.chomp

puts "Please enter the operator:"
b = gets.chomp

puts "Give me another number:"
c = gets.chomp

# To validate if user inputs are valid numbers?
def valid_num(str)
  str == "0" || str.to_i != 0
end

# To validate if the user input numbers include decimal points or not
def dec_num(str)
  str.include?(".")
end

# change data types of numbers (integer )
def num_type(x)
  if dec_num(x)
    x.to_i
  else
    x.to_i
  end
end

def domath(x, y, z)
# x = x.to_i; z = z.to_i
  if valid_num(x) && valid_num(z)
    x = num_type(x)
    z = num_type(z)

ans = case y
    when '+', 'add'
      x + z
    when '-', 'subtract'
      x - z
    when '*', 'multiply'
      x * z
    when '/', 'divide'
      # The program handles divide when attempting to divide by zero
      if z != 0
        x / z
      else puts "Please enter other than '0'"
      end
    when '%' , 'modulo'
      x % z
    when '**' , 'exponents'
      x ** z
    else
      puts "Enter a valid operator"
    end
    # p ans
    puts "#{x} #{y} #{z} = #{ans}"
  else puts "Enter valid numbers"
  end
end

domath(a,b,c)
