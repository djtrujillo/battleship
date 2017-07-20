require './lib/ship_placement'
require './lib/tile'
require 'pry'
class GameBoard
  attr_reader :player_game_board,
              :computer_game_board,
              :player_game_array,
              :computer_game_array,
              :player_patrol_boat,
              :player_destroyer,
              :computer_patrol_boat,
              :computer_destroyer

  def initialize
    @computer_game_board = {:A1 => Tile.new, :A2 => Tile.new, :A3 => Tile.new, :A4 => Tile.new,
                            :B1 => Tile.new, :B2 => Tile.new, :B3 => Tile.new, :B4 => Tile.new,
                            :C1 => Tile.new, :C2 => Tile.new, :C3 => Tile.new, :C4 => Tile.new,
                            :D1 => Tile.new, :D2 => Tile.new, :D3 => Tile.new, :D4 => Tile.new}

    @player_game_board = {:A1 => Tile.new, :A2 => Tile.new, :A3 => Tile.new, :A4 => Tile.new,
                          :B1 => Tile.new, :B2 => Tile.new, :B3 => Tile.new, :B4 => Tile.new,
                          :C1 => Tile.new, :C2 => Tile.new, :C3 => Tile.new, :C4 => Tile.new,
                          :D1 => Tile.new, :D2 => Tile.new, :D3 => Tile.new, :D4 => Tile.new}
  end

  include ShipPlacement

  def create_printable_game_boards
    @computer_game_array = [[@computer_game_board[:A1].state, @computer_game_board[:A2].state, @computer_game_board[:A3].state, @computer_game_board[:A4].state],
                            [@computer_game_board[:B1].state, @computer_game_board[:B2].state, @computer_game_board[:B3].state, @computer_game_board[:B4].state],
                            [@computer_game_board[:C1].state, @computer_game_board[:C2].state, @computer_game_board[:C3].state, @computer_game_board[:C4].state],
                            [@computer_game_board[:D1].state, @computer_game_board[:D2].state, @computer_game_board[:D3].state, @computer_game_board[:D4].state]]

    @player_game_array =   [[@player_game_board[:A1].state, @player_game_board[:A2].state, @player_game_board[:A3].state, @player_game_board[:A4].state],
                            [@player_game_board[:B1].state, @player_game_board[:B2].state, @player_game_board[:B3].state, @player_game_board[:B4].state],
                            [@player_game_board[:C1].state, @player_game_board[:C2].state, @player_game_board[:C3].state, @player_game_board[:C4].state],
                            [@player_game_board[:D1].state, @player_game_board[:D2].state, @player_game_board[:D3].state, @player_game_board[:D4].state]]

    @computer_game_array.each do |array|
      hide_computer_occupied(array)
    end
  end


  def print_game_boards
    create_printable_game_boards
    line0 =  ""
    line1 =  "==========="
    line2 =  ". 1 2 3 4"
    line3 =  "A #{@computer_game_array[0].each {|state| state}.join(' ')}"
    line4 =  "B #{@computer_game_array[1].each {|state| state}.join(' ')}"
    line5 =  "C #{@computer_game_array[2].each {|state| state}.join(' ')}"
    line6 =  "D #{@computer_game_array[3].each {|state| state}.join(' ')}"
    line7 =  "==========="
    line8 =  ""
    line9 =  "==========="
    line10 = ". 1 2 3 4"
    line11 = "A #{@player_game_array[0].each {|state| state}.join(' ')}"
    line12 = "B #{@player_game_array[1].each {|state| state}.join(' ')}"
    line13 = "C #{@player_game_array[2].each {|state| state}.join(' ')}"
    line14 = "D #{@player_game_array[3].each {|state| state}.join(' ')}"
    line15 = "==========="
    puts  line0, line1, line2, line3, line4, line5, line6, line7, line8, line9, line10, line11, line12, line13, line14, line15
  end

  def hide_computer_occupied(array)
    array.map! do |state|
      if state == "O"
        state = " "
      else
        state
      end
    end
    array
  end

  def test_inbounds(key)
    if @computer_game_board[key] == nil
      false
    else
      true
    end
  end

  def test_occupied(key)
    if @computer_game_board[key].state == "O"
      true
    else
      false
    end
  end

  def test_params(key)
    test_inbounds(key) == true && test_occupied(key) == false
  end

  def test_player_inbounds(key)
    if @player_game_board[key] == nil
      false
    else
      true
    end
  end


  def test_player_occupied(key)
    if @player_game_board[key].state == "O"
      true
    else
      false
    end
  end

  def test_player_params(key)
    test_player_inbounds(key) == true && test_player_occupied(key) == false
  end

  def player_shoot(key)
    key = key.to_sym
    # binding.pry
      if @computer_game_board[key].state == "O"
        @computer_game_board[key].hit
      elsif @computer_game_board[key].state == "M" || @computer_game_board[key].state == "H"
        "Previously shot here"
      else
        @computer_game_board[key].miss
      end
      @computer_game_board[key].state
  end

  def computer_shoot(key = player_random_key)
    if @player_game_board[key].state == "O"
      @player_game_board[key].hit
    elsif @player_game_board[key].state == "M" || @player_game_board[key].state == "H"
      "Previously shot here"
    else
      @player_game_board[key].miss
    end
    key
  end

  def test_player_hit_or_miss(key)
    key = key.to_sym
    if @computer_game_board[key].state == "M"
      return "Miss"
    else @computer_game_board[key].state == "H"
      if @computer_destroyer.include? @computer_game_board[key]
        @computer_destroyer.delete( @computer_game_board[key])
        return "Direct Hit on Destroyer!"
      else
        @computer_patrol_boat.delete(@computer_game_board[key])# remove from array
        return "Direct Hit on Patrol Boat!"
      end

    end
  end

  def test_computer_hit_or_miss(key)
    if @player_game_board[key].state == "M"
      return "Miss"
    else @player_game_board[key].state == "H"
      if @player_destroyer.include? @player_game_board[key]
        @player_destroyer.delete(@player_game_board[key])
        return "Computer Hit Your Destroyer!"
      else
        @player_patrol_boat.delete(@player_game_board[key])
        return "Computer Hit Your Patrol Boat!"
      end
    end
  end

  def test_player_boats_health
    if @player_patrol_boat.count == 0 && @player_destroyer.count == 0
      "Game Over, Computer Sank your Ships"
    elsif @player_destroyer.count == 0
      "Computer Sank Your Destroyer!"
    elsif @player_patrol_boat.count == 0
      "Computer Sank Your Patrol Boat!"
    else
    end
  end

  def test_computer_boats_health
    if @computer_destroyer.count == 0 && @computer_patrol_boat.count == 0
      "You Win!! You sank the computers Ships"
    elsif @computer_destroyer.count == 0
      "You Sank the Destroyer!"
    elsif @computer_patrol_boat.count == 0
      "You Sank the Patrol Boat!"
    else
    end
  end

  def test_patrol_boat_coordinates_are_valid(input)
    input =~ /[A-D][1-4]\s[A-D][1-4]/
  end



end
