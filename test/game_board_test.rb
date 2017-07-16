require 'minitest/autorun'
require 'minitest/pride'
require './lib/game_board'
require './lib/tile'

class GameBoardTest < Minitest::Test
  def test_game_board_exists
    game = GameBoard.new

    assert_instance_of GameBoard, game
  end

  def test_game_board_initializes_with_player_hash
    game = GameBoard.new

    expected = true
    actual = game.player_game_board.is_a? Hash

    assert_equal expected, actual
  end

  def test_player_game_board_has_instances_of_tiles
    game = GameBoard.new
    actual = game.player_game_board[:A1]

    assert_instance_of Tile, actual
  end

  def test_different_tile_location_for_instance
    game = GameBoard.new
    actual = game.player_game_board[:D2]

    assert_instance_of Tile, actual
  end

  def test_put_hash_lines_in_array
    game = GameBoard.new

    expected = [game.player_game_board[:A1].state, game.player_game_board[:A2].state, game.player_game_board[:A3].state, game.player_game_board[:A4].state]
    actual = game.player_game_array[0]

    assert_equal expected, actual
  end

  def test_different_array_line
    game = GameBoard.new

    expected = [game.player_game_board[:B1].state, game.player_game_board[:B2].state, game.player_game_board[:B3].state, game.player_game_board[:B4].state]
    actual = game.player_game_array[1]

    assert_equal expected, actual
  end

  def test_print_game_board_to_screen
    game = GameBoard.new

    # game.print_game_board
  end

  def test_computer_selects_random_tile
    game = GameBoard.new

    actual = game.comp_random_tile

    assert actual.is_a? Hash
  end

  def test_randomly_select_horizontal_or_vertical
    game = GameBoard.new
    random = game.comp_random_tile

    vertical = game.vertical?(random)

    assert vertical.is_a? Boolean
  end


  # def test_comp_places_patrol_boat
  #   game= GameBoard.new
  #   first_coord = game.computer_game_board[:A1]
  #   second_coord = game.random_by_proi




end
