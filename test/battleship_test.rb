# require 'minitest/autorun'
# require 'minitest/pride'
# require './lib/game_board'
# require './lib/tile'
# require './lib/battleship'
#
# class BattleshipTest < Minitest::Test
#   def test_battleship_class_exists
#     battleship = Battleship.new
#
#     assert_instance_of Battleship, battleship
#   end
#
#   def test_start_game_returns_answer_given
#     battleship = Battleship.new
#
#     expected = true
#     actual = battleship.start_game.is_a? String
#
#     assert_equal expected, actual
#   end
#
#   def test_game_sequence
#     battleship = Battleship.new
#
#     battleship.start_game
#   end
#
#
# end
