# require 'simplecov'
# SimpleCov.start
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
      return ship_layout
    elsif answer == "i"
      puts instructions
    elsif answer == "q"
      puts "See you later!"
    else
      puts "WTF? Read the directions!"
      return start_game_sequence
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
    while @game.test_patrol_boat_coordinates_are_valid(answer) == nil
      puts "Invalid Coordinates, please enter like (A2 A3):"
      answer = gets.chomp
    end

    keys = answer.split(" ")

    while @game.place_player_patrol_boat(keys[0], keys[1]) != "done"
      puts @game.place_player_patrol_boat(keys[0], keys[1])
      answer = gets.chomp
      keys = answer.split(" ")
    end

    puts "Enter the squares for the three-unit ship:"
    answer = gets.chomp
    keys = answer.split(" ")

    while @game.place_player_destroyer(keys[0], keys[1]) != "done"
      puts @game.place_player_destroyer(keys[0], keys[1])
      answer = gets.chomp
      keys = answer.split(" ")
    end
    @game.place_player_destroyer(keys[0], keys[1])
    player_shot_sequence
  end

  def player_shot_sequence
    @start = Time.now
    @game.print_game_boards
    puts "Enter a coordinate to fire on:"
    key = gets.chomp
    while @game.test_shot_coordinate_is_valid(key) == nil
      puts "Invalid Coordinates, please enter like (A2):"
      key = gets.chomp
    end
    while @game.player_shoot(key) != "done"
      puts @game.player_shoot(key)
      key = gets.chomp
    end
    @game.print_game_boards
    puts @game.test_player_hit_or_miss(key)
    @game.test_player_hit_or_miss(key)
    if @game.computer_patrol_boat.count == 0 && @game.computer_destroyer.count == 0
      return end_sequence
    end
    puts "Press Enter for Computer's turn"
    gets.chomp
    computer_shot_sequence
  end

  def computer_shot_sequence
    key = @game.computer_shoot
    @game.print_game_boards
    puts "Computer fired at #{key}"
    puts @game.test_computer_hit_or_miss(key)
    @game.test_computer_hit_or_miss(key)
    if @game.player_patrol_boat.count == 0 && @game.player_destroyer.count == 0
      return end_sequence
    end
    puts "Press Enter for Your turn"
    gets.chomp
    player_shot_sequence
  end

  def end_sequence
    if @game.player_patrol_boat.count == 0 && @game.player_destroyer.count == 0
      puts "You Suck! Computer Wins!"
    end
    if @game.computer_patrol_boat.count == 0 && @game.computer_destroyer.count == 0
      puts "GAME OVER, YOU WIN!!!!"
    end
    finish = Time.now
    diff = finish - @start
    puts "You played for #{diff}"
  end

  def instructions
    "Start by placing your two ships
    (patrol boat = 2, destroyer = 3)
    using coordinates.(ex. patrol
    boat = A1 A2, destroyer = A3 C3).
    Take turns firing upon the enemy
    by entering coordinates (example:
    A5.) First to sink the others
    ships wins."
  end
end

battleship = Battleship.new
battleship
