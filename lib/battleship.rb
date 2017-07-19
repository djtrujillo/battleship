require './lib/game_board'
require './lib/tile'
require './lib/battleship'
#
class Battleship

  def initialize
    @game = GameBoard.new
  end

  def start_game

    puts "Welcome to BATTLESHIP"
    puts "Would you like to (p)lay, read the (i)nstructions, or (q)uit?"
    answer = gets.chomp
      if answer == "p"
        game_sequence
      elsif answer == "i"
        puts instructions
        start_game
      elsif answer == "q"
        puts "See you later!"
      else
        puts "WTF!!, READ THE INSTRUCTIONS!"
        start_game
      end
  end

  def game_sequence
    @game.place_comp_patrol_boat
    @game.place_comp_destroyer
    puts "I have laid out my ships on the grid."
    puts "You now need to layout your two ships."
    puts "The first is two units long and the"
    puts "second is three units long."
    puts "The grid has A1 at the top left and D4 at the bottom right."
    puts ""
    puts "Enter the squares for the two-unit ship:"
    answer = gets.chomp
    keys = answer.split(" ")
    @game.place_player_patrol_boat(keys[0], keys[1])
    puts "Enter the squares for the three-unit ship:"
    answer = gets.chomp
    keys = answer.split(" ")
    @game.place_player_destroyer(keys[0], keys[1])
    player_shot_sequence
  end

  def player_shot_sequence
    # while_computer_ships_aren't sunk
    @game.print_game_boards
    puts "Enter a coordinate to fire on:"
    key = gets.chomp
    @game.player_shoot(key)
    puts @game.test_player_hit_or_miss(key)
    @game.print_game_boards
    puts "Press Enter for Next turn"
    gets.chomp
    computer_shot_sequence
    #end
    #end_sequence
  end



  def computer_shot_sequence
    #while ships are not all sunk
    key = @game.computer_shoot
    puts "Computer fired at #{key}"
    puts @game.test_computer_hit_or_miss(key)
    puts "Press Enter for next turn"
    gets.chomp
    @game.print_game_boards
    #end
    #end_sequence
  end

  def instructions
    "instructions"
  end

end

battleship = Battleship.new
battleship.start_game
