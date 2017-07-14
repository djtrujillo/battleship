require 'minitest/autorun'
require 'minitest/pride'
require './lib/game_board'

class GameBoardTest < Minitest::Test
  def test_game_board_exists
    game_board = GameBoard.new

    assert_instance_of GameBoard, game_board
  end

end
