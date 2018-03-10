require './module.rb'

class Guesser
  include Mind_Reader

  def get_guess
    puts Comments[:guess]
    @guess = get_input
  end

  def get_guess_ai(turns,orbs,guesses,index)
    puts Comments[:ai_guesser_turn]
    sleep 3
    @guess = guesser_ai_input(turns,orbs,guesses,index)
    puts Comments[:ai_guess]
    puts @guess.inspect
    return @guess
  end

  def check_guess (input)
    check_input_guesser (input)
  end
end

class Creator
  include Mind_Reader

  def get_code
    puts Comments[:code]
    @code = get_input
  end

  def get_code_ai
    puts Comments[:ai_creator_turn]
    sleep 2
    @code = creator_ai_input
  end

  def check_code (input)
    check_input_creator (input)
  end
end

#Game Mode:Two Players
class Game
  include Mind_Reader

  def initialize
   @end_turn = 12
   @guesser = Guesser.new()
   @creator = Creator.new()
  end

  def creator_play
    puts Comments[:creator_turn]
    puts ""
    @code = @creator.get_code

    while !@creator.check_code(@code) do
      puts Comments[:try_again]
      @code = @creator.get_code
    end
    30.times { puts "" }
  end

  def guesser_play
    puts Comments[:guesser_turn]
    @end_turn.times do
      puts ""
      guess = @guesser.get_guess

      while !@guesser.check_guess(guess) do
        puts Comments[:try_again]
        guess = @guesser.get_guess
      end

      break if game_over(guess, @code)
    end

    puts "Game Over"
  end

  def game_over (guess, code)
    check_game_over(guess, code)
  end
end
