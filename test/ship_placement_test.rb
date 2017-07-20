require 'minitest/autorun'
require 'minitest/pride'
require './lib/tile'
require './lib/battleship'
require './lib/game_board'
require './lib/ship_placement'

class ShipPlacementTest < Minitest::Test
  def test_ship_placement_initializes_with_game
    game = GameBoard.new
    runner = Battleship.new
    ships = ShipPlacement.new(runner, game)

    assert_instance_of GameBoard, ships.game
    assert_instance_of Battleship, ships.runner
  end

  def test_place_player_destroyer
    ships = GameBoard.new
    game.place_player_destroyer("A2", "A4")

    expected = "O"
    actual1 = game.player_game_board[:A2].state
    actual2 = game.player_game_board[:A3].state
    actual3 = game.player_game_board[:A4].state

    assert_equal expected, actual1
    assert_equal expected, actual2
    assert_equal expected, actual3
  end



end
