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
    tile = game.comp_random_tile

    vert_or_horiz = game.rand_vert_or_horiz

    assert vert_or_horiz == "vert" || "horiz"
  end


  #######need tests for "random" methods########


  def test_assign_next_tile_vert_down
    game = GameBoard.new
    key = :B2
    orientation = "vert"
    direction = "down"

    expected = :C2
    actual = game.next_tile(key, orientation, direction)

    assert_equal expected, actual
  end

  def test_assign_next_tile_vert_up
    game = GameBoard.new
    key = :B2
    orientation = "vert"
    direction = "up"

    expected = :A2
    actual = game.next_tile(key, orientation, direction)

    assert_equal expected, actual
  end

  def test_assign_next_tile_horiz_right
    game = GameBoard.new
    key = :B2
    orientation = "horiz"
    direction = "right"

    expected = :B3
    actual = game.next_tile(key, orientation, direction)

    assert_equal expected, actual
  end

  def test_assign_next_tile_horiz_left
    game = GameBoard.new
    key = :B2
    orientation = "horiz"
    direction = "left"

    expected = :B1
    actual = game.next_tile(key, orientation, direction)

    assert_equal expected, actual
  end

  def test_tile_is_in_bounds
    game = GameBoard.new
    key = :F1

    expected = false
    actual = game.test_inbounds(key)

    assert_equal expected, actual
  end

  def test_tile_is_occupied
    game = GameBoard.new
    game.computer_game_board[:A1].occupied

    expected = true
    actual = game.test_occupied(:A1)

    assert_equal expected, actual
    refute game.test_occupied(:A2)
  end

  def test_place_computer_patrol_boat
    game = GameBoard.new
    game.place_patrol_boat

  end












end
