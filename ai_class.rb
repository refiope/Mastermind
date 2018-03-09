require './class.rb'

class Game_Creator_AI < Game
  def creator_play
    @code = @creator.get_code_ai
    puts @code
    30.times { puts "" }
  end
end

class Game_Guesser_AI < Game
  def guesser_play
    @end_turn.times do
      puts ""
      guess = @guesser.get_guess_ai
      break if game_over(guess, @code)
      puts ""
    end
    puts "Game Over"
  end
end
