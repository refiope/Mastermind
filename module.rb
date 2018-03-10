Colors = ["red","blue","green","yellow","orange","black","white","pink"]
Comments = {
  welcome: "Welcome to Mindreader!",
  guess: "Choose any four of these colors #{Colors.inspect} to guess:",
  code: "Choose four out of #{Colors.inspect} colors to create a sequence (each color should be unique!): ",
  creator_turn: "The creator creates the secret-code! Guesser should look the other way!",
  ai_creator_turn: "The computer has created secret-code!",
  guesser_turn: "Guesser's turn!",
  ai_guesser_turn: "Computer is trying to figure out your code...",
  ai_guess: "Is it this code?",
  try_again: "Type the right colors:"
}

module Mind_Reader
  def get_input
    input = []
    4.times { input.push(gets.chomp) }
    input.collect! { |input| input.downcase.gsub(/[^a-z]/,"") }
    return input
  end

  # helper method for #guesser_ai_input
  def random_guess
    return Colors.sample(4)
  end

  # helper method for guesser_ai == finds the sum of orbs
  def orb_count (orb, turn)
    return orb[turn].inject(:+)
  end

  # Maybe I'll try to make this better later on when I'm bored
  def final_guess (guess)
    return guess.sample(4)
  end

  # Searching for the color that is not part of the secret code
  def find_missing_orb (orb, guesses, turn, index)
    new_guess = []
    # Go through the three-orb-count guess array to find the missing spot
    4.times { new_guess.push(guesses[turn-1-index][index]) }
    return new_guess
  end

  # Randomly guessing the color for the missing spot of the guess
  def replace_missing_orb (guess, index)
    colors = Colors
    colors.delete_if do |color|
      guess.include?(color)
    end
    guess[index-1] = colors.sample(1).join
    return guess
  end

  # AI for guessing secret code
  def guesser_ai_input (turn, orb, guesses, index)
    if turn == 0
      puts "Turn: #{turn+1}"
      return random_guess
    elsif orb_count(orb, turn-1) == 0 && index > 0
      puts "Turn: #{turn+1}"
      return replace_missing_orb(guesses[turn-1-index], index)
    elsif orb_count(orb, turn-1) == 1 && index > 0
      puts "Turn: #{turn+1}"
      return find_missing_orb(orb, guesses, turn, index)
    elsif orb_count(orb, turn-1) < 3
      puts "Turn: #{turn+1}"
      return random_guess
    elsif orb_count(orb, turn-1) == 3 && index > 0
      puts "Turn: #{turn+1}"
      return replace_missing_orb(guesses[turn-1], index)
    elsif orb_count(orb, turn-1) == 3
      puts "Turn: #{turn+1}"
      return find_missing_orb(orb, guesses, turn, index)
    else
      puts "Turn: #{turn+1}"
      return final_guess(guesses[turn-1])
    end
  end

  # AI for creating secret code
  def creator_ai_input
    return Colors.sample(4)
  end

  def check_input_guesser (guess)
    guess.each do |guess|
      return false if !(check_inside_Colors(guess))
    end
    return true
  end

  def check_input_creator (code)
    code.each do |color|
      return false if check_inside_Colors(code)
    end
    code == code.uniq ? (return true) : (return false)
  end

  # helper method for checking input: used in check_input_guesser and creator
  def check_inside_Colors (string)
    Colors.include?(string)
  end

  # helper method for #check_game_over
  def give_hint (guess, code)
    #red_orb => right color, position
    #white_orb => right color, wrong position
    red_orb = 0
    white_orb = 0

    code.each_with_index do |color, index|
      if (guess[index] == color)
        red_orb += 1
      elsif (guess.include?(color))
        white_orb += 1
      end
    end

    return [red_orb,white_orb]
  end

  #Check number of red_orbs, depends on #give_hint method
  def check_game_over (guess, code)
    red_orb = give_hint(guess,code)[0]
    white_orb = give_hint(guess,code)[1]
    puts "Red Orb: #{red_orb}, White Orb: #{white_orb}"
    (give_hint(guess, code)[0] == 4) ? true : false
  end
end
