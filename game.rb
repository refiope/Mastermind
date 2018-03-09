#Executing game
require './class.rb'
require './ai_class.rb'

puts "Welcome to Mastermind!"
puts "For 2-player mode type '1'"
puts "Otherwise type '2' for playing as 'Creator',"
puts "Or type '3' for playing as 'Guesser'"

mode = gets.chomp

case mode
when '1'
  two_player_mode = Game.new
  two_player_mode.creator_play
  two_player_mode.guesser_play
when '2'
  creator_player_mode = Game_Guesser_AI.new
  creator_player_mode.creator_play
  creator_player_mode.guesser_play
when '3'
  guesser_player_mode = Game_Creator_AI.new
  guesser_player_mode.creator_play
  guesser_player_mode.guesser_play
else
  puts "You typed in wrong input"
end
