require './module.rb'

class Guesser
  include Mind_Reader

  def get_guess
    puts "Choose any four of these colors #{Colors.inspect} to guess: "
    @@guess = get_input
  end

  def check_guess (input)
    check_input_guesser (input)
  end
end

class Creator
  include Mind_Reader

  def get_code
    puts "Choose four out of #{Colors.inspect} colors to create a sequence (each color should be unique!): "
    @@code = get_input
  end

  def check_code (input)
    check_input_creator (input)
  end

  def give_hint
  end
end

class Game
  def initialize (turn)
   @turn = turn
   guesser = Guesser.new()
   creator = Creator.new()
  end

  def play
    @turn.times do
    end
  end

  def compare
  end

  def check_game_over
  end
end
