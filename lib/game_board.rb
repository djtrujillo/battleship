require './lib/tile'
class GameBoard
  attr_reader :player_game_board,
              :computer_game_board,
              :player_game_array,
              :computer_game_array

  def initialize
    @computer_game_board = {:A1 => Tile.new, :A2 => Tile.new, :A3 => Tile.new, :A4 => Tile.new,
                            :B1 => Tile.new, :B2 => Tile.new, :B3 => Tile.new, :B4 => Tile.new,
                            :C1 => Tile.new, :C2 => Tile.new, :C3 => Tile.new, :C4 => Tile.new,
                            :D1 => Tile.new, :D2 => Tile.new, :D3 => Tile.new, :D4 => Tile.new}

    @player_game_board = {:A1 => Tile.new, :A2 => Tile.new, :A3 => Tile.new, :A4 => Tile.new,
                          :B1 => Tile.new, :B2 => Tile.new, :B3 => Tile.new, :B4 => Tile.new,
                          :C1 => Tile.new, :C2 => Tile.new, :C3 => Tile.new, :C4 => Tile.new,
                          :D1 => Tile.new, :D2 => Tile.new, :D3 => Tile.new, :D4 => Tile.new}
        game_arrays
  end

  def game_arrays
    @computer_game_array = [[@computer_game_board[:A1].state, @computer_game_board[:A2].state, @computer_game_board[:A3].state, @computer_game_board[:A4].state],
                            [@computer_game_board[:B1].state, @computer_game_board[:B2].state, @computer_game_board[:B3].state, @computer_game_board[:B4].state],
                            [@computer_game_board[:C1].state, @computer_game_board[:C2].state, @computer_game_board[:C3].state, @computer_game_board[:C4].state],
                            [@computer_game_board[:D1].state, @computer_game_board[:D2].state, @computer_game_board[:D3].state, @computer_game_board[:D4].state]]

    @player_game_array =   [[@player_game_board[:A1].state, @player_game_board[:A2].state, @player_game_board[:A3].state, @player_game_board[:A4].state],
                            [@player_game_board[:B1].state, @player_game_board[:B2].state, @player_game_board[:B3].state, @player_game_board[:B4].state],
                            [@player_game_board[:C1].state, @player_game_board[:C2].state, @player_game_board[:C3].state, @player_game_board[:C4].state],
                            [@player_game_board[:D1].state, @player_game_board[:D2].state, @player_game_board[:D3].state, @player_game_board[:D4].state]]
  end

  def print_game_boards
    line0 =  ""
    line1 =  "==========="
    line2 =  ". 1 2 3 4"
    line3 =  "A#{@computer_game_array[0].each {|tile| print tile}.join('')}"
    line4 =  "B#{@computer_game_array[1].each {|tile| print tile}.join('')}"
    line5 =  "C#{@computer_game_array[2].each {|tile| print tile}.join('')}"
    line6 =  "D#{@computer_game_array[3].each {|tile| print tile}.join('')}"
    line7 =  "==========="
    line8 =  ""
    line9 =  "==========="
    line10 = ". 1 2 3 4"
    line11 = "A#{@player_game_array[0].each {|tile| print tile}.join('')}"
    line12 = "B#{@player_game_array[1].each {|tile| print tile}.join('')}"
    line13 = "C#{@player_game_array[2].each {|tile| print tile}.join('')}"
    line14 = "D#{@player_game_array[3].each {|tile| print tile}.join('')}"
    line15 = "==========="
    puts line0, line1, line2, line3, line4, line5, line6, line7, line8, line9, line10, line11, line12, line13, line14, line15
  end

  def comp_random_tile
    patrol_boat = Hash[@computer_game_board.to_a.sample(1)]
  end

  def vertical?


  end

  # def parameter_check
  #   if comp_random_tile.key.to_s








end
 # game= GameBoard.new
 # game.print_game_boards
