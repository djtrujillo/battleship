require 'minitest/autorun'
require 'minitest/pride'
require './lib/game_board'
require './lib/tile'
require 'pry'

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


  def test_print_game_board_to_screen
    game = GameBoard.new

    # game.print_game_board
  end

  def test_computer_selects_random_key
    game = GameBoard.new

    actual = game.comp_random_key

    assert_equal Symbol, actual.class
  end

  def test_randomly_select_horizontal_or_vertical

    game = GameBoard.new
    tile = game.comp_random_key

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

  def test_third_key_for_destroyer

    game = GameBoard.new
    key1 = :C3
    key2 = :D3

    expected = :B3
    actual = game.third_key_for_destroyer(key1, key2)
  end

  #######test place destroyer and patrol boat###########

  def test_player_place_patrol_boat
    game = GameBoard.new
    game.place_player_patrol_boat("A2", "A3")

    expected = "O"
    actual = game.player_game_board[:A2].state

    assert_equal expected, actual
  end

  def test_error_when_player_boat_on_occupied
    game = GameBoard.new
    game.place_player_patrol_boat("A2", "A3")

    expected = "Error"
    actual = game.place_player_patrol_boat("A2", "B2")

    assert_equal expected, actual
  end

  def test_find_middle_key
    game = GameBoard.new

    expected = :A3
    actual = game.find_middle_key(:A2,:A4)

    assert_equal expected, actual
  end


  def test_place_player_destroyer
    game = GameBoard.new
    game.place_player_destroyer("A2", "A4")

    expected = "O"
    actual1 = game.player_game_board[:A2].state
    actual2 = game.player_game_board[:A3].state
    actual3 = game.player_game_board[:A4].state

    assert_equal expected, actual1
    assert_equal expected, actual2
    assert_equal expected, actual3
  end

  def test_error_when_player_destroyer_on_occupied
    game = GameBoard.new
    game.place_player_destroyer("A2", "A4")

    expected = "Error"
    actual = game.place_player_destroyer("A2", "C2")

    assert_equal expected, actual
  end

  def test_player_is_able_to_shoot
    game = GameBoard.new
    game.player_shoot(:A1)

    expected = "M"
    actual = game.computer_game_board[:A1].state

    assert_equal expected, actual
  end

  def test_computer_shoot
    game = GameBoard.new
    game.computer_shoot(:A2)

    expected = "M"
    actual = game.player_game_board[:A2].state

    assert_equal expected, actual
  end

end
