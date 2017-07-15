require 'minitest/autorun'
require 'minitest/pride'
require './lib/tile'

class TileTest < Minitest::Test
  def test_tile_class_exists
    tile = Tile.new

    assert_instance_of Tile, tile
  end

  def test_tile_initiates_as_blank
    tile = Tile.new

    expected = " "
    actual = tile.state

    assert_equal expected, actual
  end

  def test_hit_changes_state_to_H
    tile = Tile.new

    expected = "H"
    actual = tile.hit

    assert_equal expected, actual
  end

  def test_miss_changes_state_to_M
    tile = Tile.new

    expected = "M"
    actual = tile.miss

    assert_equal expected, actual
  end

end
