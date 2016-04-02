# Program that proves 2 * 2 is 5 :)
class Fixnum
  # straight forward: override to_s
  def new_to_s
    self == 4 ? '5' : old_to_s
  end
  alias old_to_s to_s
  alias to_s new_to_s

  # little more tricky: override multiplication of 2 * 2 
  def new_mult(x)
    self == 2 && x == 2 ? 5 : old_mult(x)
  end
  alias old_mult *
  alias * new_mult
end

puts "1: #{1}"
puts "1 + 2: #{1 + 2}"
puts "2 + 2: #{2 + 2}"
puts "2 * 2: #{2 * 2}"
puts "1 * 4: #{1 * 4}"
puts "5 - 1: #{5 - 1}"
