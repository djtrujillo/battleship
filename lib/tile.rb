require 'simplecov'
SimpleCov.start
class Tile
  attr_reader :state

  def initialize
    @state = " "
  end

  def hit
    @state = "H"
  end

  def miss
    @state = "M"
  end

  def occupied
    @state = "O"
  end
end
