class Battleship

  def initialize
  end

  def start_game
    answer = ""
    while answer !=
    puts "Welcome to BATTLESHIP"
    puts "Would you like to (p)lay, read the (i)nstructions, or (q)uit?"
    answer = gets.chomp
    if answer == "p"
      game_sequence
    elsif answer == "i"
      instructions
    elsif answer == "q"
      puts "See you later!"
    else
      puts "WTF!!, READ THE INSTRUCTIONS!"
    end
  end

  def game_sequence
  end

  def instructions
  end




end
