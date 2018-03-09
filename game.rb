#Executing game
require './class.rb'

puts "Welcome to a game of Mastermind! How many turns would you like to play?"
turns = gets.chomp

new_game = Game.new(turns)
new_game.play
