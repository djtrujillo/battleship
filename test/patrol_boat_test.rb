require 'minitest/autorun'
require 'minitest/pride'
require './lib/patrol_boat'

class PatrolBoatTest < Minitest::Test
  def test_ship_exists
    ship = PatrolBoat.new

    assert_instance_of PatrolBoat, ship
  end


end
