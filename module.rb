Colors = ["red","blue","green","yellow","orange","black","white","pink"]

module Mind_Reader
  def get_input
    input = []
    4.times { guess.push(gets.chomp) }
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
      return false if !(check_inside_Colors(code))
    end
    code == code.uniq ? true : false
  end

  # helper method for checking input: used in check_input_guesser and creator
  def check_inside_Colors (string)
    Colors.include?(string.downcase.gsub(/[^a-z]/,""))
  end
end
