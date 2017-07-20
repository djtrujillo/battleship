# require 'simplecov'
# SimpleCov.start
require './lib/ship_placement'
require './lib/tile'
require 'pry'

module Validation

  def test_inbounds(key)
    if @computer_game_board[key] == nil
      false
    else
      true
    end
  end

  def test_occupied(key)
    if @computer_game_board[key].state == "O"
      true
    else
      false
    end
  end

  def test_params(key)
    test_inbounds(key) == true && test_occupied(key) == false
  end

  def test_player_inbounds(key)
    if @player_game_board[key] == nil
      false
    else
      true
    end
  end

  def test_player_occupied(key)
    if @player_game_board[key].state == "O"
      true
    else
      false
    end
  end

  def test_player_params(key)
    test_player_inbounds(key) == true && test_player_occupied(key) == false
  end

  def test_patrol_boat_coordinates_are_valid(input)
    input =~ /[A-D][1-4]\s[A-D][1-4]/
  end

  def test_shot_coordinate_is_valid(input)
    input =~ /[A-D[1-4]]/
  end

end
