require './lib/tile'
class GameBoard
  attr_reader :game_board

  def initialize
    @game_board = {:A1 => Tile.new, :A2 => Tile.new, :A3 => Tile.new, :A4 => Tile.new,
                   :B1 => Tile.new, :B2 => Tile.new, :B3 => Tile.new, :B4 => Tile.new,
                   :C1 => Tile.new, :C2 => Tile.new, :C3 => Tile.new, :C4 => Tile.new,
                   :D1 => Tile.new, :D2 => Tile.new, :D3 => Tile.new, :D4 => Tile.new}
    game_array
  end

  def game_array
    @game_array = [[@game_board[:A1].state, @game_board[:A2].state, @game_board[:A3].state, @game_board[:A4].state],
                   [@game_board[:B1].state, @game_board[:B2].state, @game_board[:B3].state, @game_board[:B4].state],
                   [@game_board[:C1].state, @game_board[:C2].state, @game_board[:C3].state, @game_board[:C4].state],
                   [@game_board[:D1].state, @game_board[:D2].state, @game_board[:D3].state, @game_board[:D4].state]]
  end

  def print_game_board
    line0 = ""
    line1 = "==========="
    line2 = ". 1 2 3 4"
    line3 = "A#{@game_array[0].each {|tile| print tile}.join('')}"
    line4 = "B#{@game_array[1].each {|tile| print tile}.join('')}"
    line5 = "C#{@game_array[2].each {|tile| print tile}.join('')}"
    line6 = "D#{@game_array[3].each {|tile| print tile}.join('')}"
    line7 = "==========="

    puts line0, line1, line2, line3, line4, line5, line6, line7
  end

  
end
