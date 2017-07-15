require 'minitest/autorun'
require 'minitest/pride'
require './lib/game_board'
require './lib/tile'

class GameBoardTest < Minitest::Test
  def test_game_board_exists
    game = GameBoard.new

    assert_instance_of GameBoard, game
  end

  def test_game_board_initializes_with_hash
    game = GameBoard.new

    expected = true
    actual = game.game_board.is_a? Hash

    assert_equal expected, actual
  end

  def test_game_board_has_instances_of_tiles
    game = GameBoard.new
    actual = game.game_board[:A1]

    assert_instance_of Tile, actual
  end

  def test_different_tile_location_for_instance
    game = GameBoard.new
    actual = game.game_board[:D2]

    assert_instance_of Tile, actual
  end

  def test_put_hash_lines_in_array
    game = GameBoard.new

    expected = [game.game_board[:A1].state, game.game_board[:A2].state, game.game_board[:A3].state, game.game_board[:A4].state]
    actual = game.game_array[0]

    assert_equal expected, actual
  end

  def test_different_array_line
    game = GameBoard.new

    expected = [game.game_board[:B1].state, game.game_board[:B2].state, game.game_board[:B3].state, game.game_board[:B4].state]
    actual = game.game_array[1]

    assert_equal expected, actual
  end

  def test_print_game_board_to_screen
    game = GameBoard.new
    game.game_array
    # game.print_game_board
  end

  


end
