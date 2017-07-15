require 'minitest/autorun'
require 'minitest/pride'
require './lib/destroyer'
require './lib/patrol_boat'
require './lib/tile'
require './lib/battleship'

class BattleshipTest < Minitest::Test
  def test_battleship_class_exists
    battleship = Battleship.new

    assert_instance_of Battleship, battleship
  end

end
