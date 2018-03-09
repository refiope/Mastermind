Colors = ["red","blue","green","yellow","orange","black","white","pink"]

module Mind_Reader
  def get_input
    input = []
    4.times { input.push(gets.chomp) }
    input.collect! { |input| input.downcase.gsub(/[^a-z]/,"") }
    return input
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

    puts "Red Orb: #{red_orb}, White Orb: #{white_orb}"

    return red_orb
  end

  #Check number of red_orbs, depends on #give_hint method
  def check_game_over (guess, code)
    (give_hint(guess, code) == 4) ? true : false
  end
end
