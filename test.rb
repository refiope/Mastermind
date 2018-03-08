# Rules of Mastermind: I'm going to work with numbers instead because that'd be easier to code with
# and it's the same game still. Colors can still be used too if needed.
# Player (computer) has to guess in x turns what four order of numbers the other player (computer)
# set up. Player has to guess the right numbers in right position. After every guess,
# the other player (computer) gives hints on whether the player has got the right number
# and the right position, or just the right number at wrong position. This can be done by
# showing either the red number (for getting it exactly right) or the white number (for only getting
# the right number). The player's four inputs can be the same number. However, the secret sequence
# should each have a unique number.
# The iteration process should go like this:
# turn 1: gets user input => check input validation => compare the input to the secret sequence
# => store the info of the comparison => give appropriate hints => turn 2

# Class needed:
#
# Guesser, Creator, Game and maybe a module to keep things nice
