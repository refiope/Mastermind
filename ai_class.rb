require './class.rb'

#Game mode:Player as Guesser
class Game_Creator_AI < Game
  def creator_play
    @code = @creator.get_code_ai
    puts @code
    30.times { puts "" }
  end
end

#Game mode:Player as Creator
class Game_Guesser_AI < Game

  def guesser_play
    @orbs = []
    right_guess = []
    guesses = []
    index = 0

    @end_turn.times do |turn|
      puts ""
      guess = @guesser.get_guess_ai(turn, @orbs, guesses, index)
      index += 1 if guess.uniq != guess
      @orbs.push(give_hint(guess, @code))
      guesses.push(guess)

      break if game_over(guess, @code)
      puts ""
    end
    puts "Game Over"
  end
end
