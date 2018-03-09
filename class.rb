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
    return @@code
  end

  def check_code (input)
    check_input_creator (input)
  end
end

class Game
  include Mind_Reader

  def initialize (number_of_turns)
   @@end_turn = number_of_turns.to_i
   @@guesser = Guesser.new()
   @@creator = Creator.new()
  end

  def play
    code = @@creator.get_code

    while !@@creator.check_code(code) do
      puts "Type the right colors:"
      code = @@creator.get_code
    end

    @@end_turn.times do
      guess = @@guesser.get_guess

      while !@@guesser.check_guess(guess) do
        puts "Type the right colors:"
        guess = @@guesser.get_guess
      end

      break if game_over(guess, code)
    end

    puts "Game Over"
  end

  def game_over (guess, code)
    check_game_over(guess, code)
  end
end
