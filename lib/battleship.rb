require './lib/game_board'
require './lib/tile'
require './lib/battleship'

class Battleship

  def initialize
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
      answer
    end

  def game_sequence
    @game = GameBoard.new
    game.place_patrol_boat
    game.place_destroyer

    puts "I have laid out my ships on the grid."
    puts "You now need to layout your two ships."
    puts "The first is two units long and the"
    puts "second is three units long."
    puts "The grid has A1 at the top left and D4 at the bottom right."
    puts ""
    puts "Enter the squares for the two-unit ship:"

    answer = gets.chomp

    keys = answer.split(" ")

    game.place_player_patrol_boat(keys[0], keys[1])

    puts "Enter the squares for the three-unit ship:"

    answer = gets.chomp

    keys = answer.split(" ")

    game.place_player_destroyer(keys[0], keys[1])
    player_shot_sequence
  end

  def player_shot_sequence
    @game.print_game_boards
    puts "Enter a coordinate to fire on:"
    key = gets.chomp
    @game.player_shoot(key)
    puts @game.test_player_hit_or_miss(key)
    @game.print_game_boards
    puts 
    computer_shot_sequence
  end

  def computer_shot_sequence






  end

  def instructions
    "instructions"
  end

end

battleship = Battleship.new
battleship.start_game
