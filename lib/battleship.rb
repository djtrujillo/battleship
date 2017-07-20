require './lib/game_board'
require './lib/tile'
require './lib/battleship'

class Battleship
  def initialize
    @game = GameBoard.new
    start_game_sequence
  end

  def start_game_sequence
    puts "Welcome to BATTLESHIP"
    puts "Would you like to (p)lay, read the (i)nstructions, or (q)uit?"
    answer = gets.chomp
    if answer == "p"
      ship_layout
    elsif answer == "i"
      instructions
    elsif answer == "q"
      puts "See you later!"
    else
      puts "WTF? Read the directions!"
      start_game_sequence
    end
    end_sequence
  end

  def ship_layout
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
    @game.print_game_boards
    puts "Enter a coordinate to fire on:"
    key = gets.chomp
    @game.player_shoot(key)
    @game.print_game_boards
    puts @game.test_player_hit_or_miss(key)
    @game.test_player_hit_or_miss(key)
    puts @game.test_computer_boats_health
    @game.test_computer_boats_health
    puts "Press Enter for Next turn"
    gets.chomp
    if @game.computer_patrol_boat.count == 0 && @game.computer_destroyer.count == 0
      end_sequence
    else
      computer_shot_sequence
    end
  end

  def computer_shot_sequence
    key = @game.computer_shoot
    @game.print_game_boards
    puts "Computer fired at #{key}"
    puts @game.test_computer_hit_or_miss(key)
    @game.test_computer_hit_or_miss(key)
    puts @game.test_player_boats_health
    @game.test_player_boats_health
    gets.chomp
    if @game.player_patrol_boat.count == 0 && @game.player_destroyer.count == 0
      end_sequence
    else
      player_shot_sequence
    end
  end

  def end_sequence
    "Game Over!"
  end

  def instructions
    "Start by placing your two ships (patrol boat = 2,
    destroyer = 3) using coordinates.(ex. patrol boat = A1 A2,
    destroyer = A3 C3).
    Take turns firing upon the enemy
    by calling out plot points (example: A5.)
    First to sink the others ships wins."
  end
end

battleship = Battleship.new
battleship
