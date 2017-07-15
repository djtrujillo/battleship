class GameBoard
  attr_reader :game_board

  def initialize
    @game_board = {:A1 => Tile.new, :A2 => Tile.new, :A3 => Tile.new, :A4 => Tile.new,
                   :B1 => Tile.new, :B2 => Tile.new, :B3 => Tile.new, :B4 => Tile.new,
                   :C1 => Tile.new, :C2 => Tile.new, :C3 => Tile.new, :C4 => Tile.new,
                   :D1 => Tile.new, :D2 => Tile.new, :D3 => Tile.new, :D4 => Tile.new}
  end

  def game_array
    game_array = [[@game_board[:A1], @game_board[:A2], @game_board[:A3], @game_board[:A4]],
                  [@game_board[:B1], @game_board[:B2], @game_board[:B3], @game_board[:B4]],
                  [@game_board[:C1], @game_board[:C2], @game_board[:C3], @game_board[:C4]],
                  [@game_board[:D1], @game_board[:D2], @game_board[:D3], @game_board[:D4]]]
  end


end
