#Executing game
require './class.rb'
require './ai_class.rb'

def game_mode (game_type)
  mode = game_type
  mode.creator_play
  mode.guesser_play
end

puts Comments[:welcome]
puts "For 2-player mode type '1'"
puts "Otherwise type '2' for playing as 'Creator',"
puts "Or type '3' for playing as 'Guesser'"

# Selecting game mode
mode = gets.chomp

case mode
when '1'
  game_mode (Game.new)
when '2'
  game_mode (Game_Guesser_AI.new)
when '3'
  game_mode (Game_Creator_AI.new)
else
  puts "You typed in wrong input"
end
