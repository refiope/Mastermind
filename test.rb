# Rules of Mastermind: I'm going to work with colors instead because that'd be easier to code with
# and it's the same game still. Colors can still be used too if needed.
# Player (computer) has to guess in x turns what four order of colors the other player (computer)
# set up. Player has to guess the right colors in right position. After every guess,
# the other player (computer) gives hints on whether the player has got the right color
# and the right position, or just the right color at wrong position. This can be done by
# showing either the red color (for getting it exactly right) or the white color (for only getting
# the right color). The player's four inputs can be the same color. However, the secret sequence
# should each have a unique color.
# The iteration process should go like this:
# turn 1: gets user input => check input validation => compare the input to the secret sequence
# => store the info of the comparison => give appropriate hints => turn 2

# Class needed:
#
# Guesser, Creator, Game and maybe a module to keep things nice

# Crucial Variables:
# Guesser's guess: array of four colors
# Creator's sequence: array of four colors (out of 9 colors)
# color of turns: color
# hints: array of two info => first: number of right color and position, second: number of right color at wrong position
# ^ this will be stored when comparing the two arrays
Colors = ["red","blue","green","yellow","orange","black","white","pink"]

def get_input
  puts "Choose any four of these #{Colors} to guess: "
  guess = []
  4.times { guess.push(gets.chomp) }
  return guess
end

def check_input_creator (code)
  code.each do |color|
    return false if !(check_inside_Colors(color))
  end
  code == code.uniq ? true : false
end

# helper method for checking input: used in check_input_guesser and creator
def check_inside_Colors (string)
  Colors.include?(string.downcase.gsub(/[^a-z]/,""))
end

puts check_input_creator (get_input)
