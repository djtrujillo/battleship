require './lib/tile'
require 'pry'
class GameBoard
  attr_reader :player_game_board,
              :computer_game_board,
              :player_game_array,
              :computer_game_array,
              :player_patrol_boat,
              :player_destroyer,
              :computer_patrol_boat,
              :computer_destroyer

  def initialize
    @computer_game_board = {:A1 => Tile.new, :A2 => Tile.new, :A3 => Tile.new, :A4 => Tile.new,
                            :B1 => Tile.new, :B2 => Tile.new, :B3 => Tile.new, :B4 => Tile.new,
                            :C1 => Tile.new, :C2 => Tile.new, :C3 => Tile.new, :C4 => Tile.new,
                            :D1 => Tile.new, :D2 => Tile.new, :D3 => Tile.new, :D4 => Tile.new}

    @player_game_board = {:A1 => Tile.new, :A2 => Tile.new, :A3 => Tile.new, :A4 => Tile.new,
                          :B1 => Tile.new, :B2 => Tile.new, :B3 => Tile.new, :B4 => Tile.new,
                          :C1 => Tile.new, :C2 => Tile.new, :C3 => Tile.new, :C4 => Tile.new,
                          :D1 => Tile.new, :D2 => Tile.new, :D3 => Tile.new, :D4 => Tile.new}
  end

  def print_game_boards
    @computer_game_array = [[@computer_game_board[:A1].state, @computer_game_board[:A2].state, @computer_game_board[:A3].state, @computer_game_board[:A4].state],
                            [@computer_game_board[:B1].state, @computer_game_board[:B2].state, @computer_game_board[:B3].state, @computer_game_board[:B4].state],
                            [@computer_game_board[:C1].state, @computer_game_board[:C2].state, @computer_game_board[:C3].state, @computer_game_board[:C4].state],
                            [@computer_game_board[:D1].state, @computer_game_board[:D2].state, @computer_game_board[:D3].state, @computer_game_board[:D4].state]]

    @player_game_array =   [[@player_game_board[:A1].state, @player_game_board[:A2].state, @player_game_board[:A3].state, @player_game_board[:A4].state],
                            [@player_game_board[:B1].state, @player_game_board[:B2].state, @player_game_board[:B3].state, @player_game_board[:B4].state],
                            [@player_game_board[:C1].state, @player_game_board[:C2].state, @player_game_board[:C3].state, @player_game_board[:C4].state],
                            [@player_game_board[:D1].state, @player_game_board[:D2].state, @player_game_board[:D3].state, @player_game_board[:D4].state]]
# binding.pry
    line0 =  ""
    line1 =  "==========="
    line2 =  ". 1 2 3 4"
    line3 =  "A #{@computer_game_array[0].each {|state| state}.join(' ')}"
    line4 =  "B #{@computer_game_array[1].each {|state| state}.join(' ')}"
    line5 =  "C #{@computer_game_array[2].each {|state| state}.join(' ')}"
    line6 =  "D #{@computer_game_array[3].each {|state| state}.join(' ')}"
    line7 =  "==========="
    line8 =  ""
    line9 =  "==========="
    line10 = ". 1 2 3 4"
    line11 = "A #{@player_game_array[0].each {|state| state}.join(' ')}"
    line12 = "B #{@player_game_array[1].each {|state| state}.join(' ')}"
    line13 = "C #{@player_game_array[2].each {|state| state}.join(' ')}"
    line14 = "D #{@player_game_array[3].each {|state| state}.join(' ')}"
    line15 = "==========="
    puts  line0, line1, line2, line3, line4, line5, line6, line7, line8, line9, line10, line11, line12, line13, line14, line15
  end

  def comp_random_key
    @computer_game_board.to_a.sample(1)[0][0]
  end

  def player_random_key
    @player_game_board.to_a.sample(1)[0][0]
  end

  def orientation(key)
    rando = rand_vert_or_horiz
    if rando == "vert"
      direction = rand_up_or_down
    else
      direction = rand_left_or_right
    end
    directions_for_next_tile = {:orientation => rando, :direction => direction}
  end

  def new_tile_key(key)
    directions = orientation(key)
    new_key = next_tile(key, directions[:orientation], directions[:direction])
  end

  def next_tile(key, orientation, direction)
    key_string = key.to_s
    if orientation == "vert"
      if direction == "down"
        key_string[0] = key_string[0].next
      elsif direction == "up"
        key_string[0] = (key_string[0].ord-1).chr
      end
    elsif orientation == "horiz"
      if direction == "right"
        key_integer = key_string[1].to_i
        key_string[1] = (key_integer += 1).to_s
      elsif direction == "left"
        key_integer = key_string[1].to_i
        key_string[1] = (key_integer -= 1).to_s
      end
    end
    key = key_string.to_sym
  end

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

  def test_player_occupied(key)
    if @player_game_board[key].state == "O"
      true
    else
      false
    end
  end

  def test_player_params(key)
    test_inbounds(key) == true && test_player_occupied(key) == false
  end

  def third_key_for_destroyer(key1, key2)
    key1 = key1.to_s.split('')
    key2 = key2.to_s.split('')
    key3 = []

    if key1[0] == key2[0]
      if (key1[1].to_i + 1) == key2[1].to_i
        key3 << key2[0]
        key3 << (key2[1].to_i + 1).to_s
      else
        key3 << key2[0]
        key3 << (key2[0].to_i - 1).to_s
      end
    else
      if key1[0] == key2[0].next
        key3 << (key2[0].ord-1).chr
        key3 << key2[1]
      else
        key3 << key2[0].next
        key3 << key2[1]
      end
    end
    key3.join('').to_sym
  end

  def place_comp_destroyer
    key1 = comp_random_key

    while test_params(key1) == false
      key1 = comp_random_key
    end

    key2 = new_tile_key(key1)

    while test_params(key1) == false || test_params(key2) == false
      key1 = comp_random_key
      key2 = new_tile_key(key1)
    end

    key3 = third_key_for_destroyer(key1, key2)

    while test_params(key1) == false || test_params(key2) == false || test_params(key3) == false
      key1 = comp_random_key
      key2 = new_tile_key(key1)
      key3 = third_key_for_destroyer(key1, key2)
    end


    @computer_game_board[key1].occupied
    @computer_game_board[key2].occupied
    @computer_game_board[key3].occupied

    @computer_destroyer = [@computer_game_board[key1], @computer_game_board[key2], @computer_game_board[key3]]

    key3
  end

  def find_middle_key(coord1, coord2)
    key1 = coord1.to_s.split('')
    key3 = coord2.to_s.split('')
    key2 = []
    if key1[0] == key3[0]
      key2 << key1[0]
      key2 << (key3[1].to_i - 1).to_s
    else
      key2 << (key3[0].ord-1).chr
      key2 << key3[1]
    end
    key2.join('').to_sym
  end

  def place_comp_patrol_boat
    key1 = comp_random_key

    while test_params(key1) == false
      key1 = comp_random_key
    end

    key2 = new_tile_key(key1)

    while test_params(key2) == false
      key1 = comp_random_key
      key2 = new_tile_key(key1)
    end

    @computer_game_board[key1].occupied
    @computer_game_board[key2].occupied

    @computer_patrol_boat = [@computer_game_board[key1], @computer_game_board[key2]]

    key2
  end

  def place_player_patrol_boat(coord1, coord2)
    key1 = coord1.to_sym
    key2 = coord2.to_sym

    if test_player_params(key1) == false || test_player_params(key2) == false
      return "Error"
    end

    @player_game_board[key1].occupied
    @player_game_board[key2].occupied

    @player_patrol_boat = [@player_game_board[key1], @player_game_board[key2]]
  end

  def place_player_destroyer(coord1, coord2)
    key1 = coord1.to_sym
    key3 = coord2.to_sym
    key2 = find_middle_key(key1, key3)

    if test_player_params(key1) == false || test_player_params(key2) == false || test_player_params(key3) == false
      return "Error"
    end

    @player_game_board[key1].occupied
    @player_game_board[key2].occupied
    @player_game_board[key3].occupied

    @player_destroyer = [@player_game_board[key1], @player_game_board[key2], @player_game_board[key3]]
  end


  def rand_vert_or_horiz
    random = random_number
    if random == 0
      "vert"
    else
      "horiz"
    end
  end

  def rand_up_or_down
    random = random_number
    if random == 0
      "up"
    else
      "down"
    end
  end

  def rand_left_or_right
    random = random_number
    if random == 0
      "right"
    else
      "left"
    end
  end

  def random_number
    random = Random.new
    random.rand(2)
  end


  def player_shoot(key)
    key = key.to_sym
    # binding.pry
      if @computer_game_board[key].state == "O"
        @computer_game_board[key].hit
      elsif @computer_game_board[key].state == "M" || @computer_game_board[key].state == "H"
        "Previously shot here"
      else
        @computer_game_board[key].miss
      end
      @computer_game_board[key].state
  end

  def computer_shoot(key = player_random_key)
    if @player_game_board[key].state == "O"
      @player_game_board[key].hit
    elsif @player_game_board[key].state == "M" || @player_game_board[key].state == "H"
      "Previously shot here"
    else
      @player_game_board[key].miss
    end
    key
  end

  def test_player_hit_or_miss(key)
    key = key.to_sym
    if @computer_game_board[key].state == "M"
      "Miss"
    else @computer_game_board[key].state == "H"
      if @computer_destroyer.include? @computer_game_board[key]
        "Direct Hit on Destroyer!"
        @computer_destroyer.delete( @computer_game_board[key])#remove from array
      else
        "Direct Hit on Patrol Boat!"
        @computer_patrol_boat.delete(@computer_game_board[key])# remove from array
      end
      
      if @computer_destroyer.count == 0 && @computer_patrol_boat.count == 0
        "You Win!! You sank the computers Ships"
      elsif @computer_destroyer.count == 0
        "You Sank the Destroyer!"
      elsif @computer_patrol_boat.count == 0
        "You Sank the Patrol Boat!"
      else
      end
    end
  end

  def test_computer_hit_or_miss(key)
    if @player_game_board[key].state == "M"
      "Miss"
    else @player_game_board[key].state == "H"
      if @player_destroyer.include? @player_game_board[key]
        "Computer Hit Your Destroyer!"
        @player_destroyer.delete(@player_game_board[key])
      else
        "Computer Hit Your Patrol Boat!"
        @player_patrol_boat.delete(@player_game_board[key])
      end

      if @player_patrol_boat.count == 0 && @player_destroyer.count == 0
        "Game Over, Computer Sank your Ships"
      elsif @player_destroyer.count == 0
        "Computer Sank Your Destroyer!"
      elsif @player_patrol_boat.count == 0
        "Computer Sank Your Patrol Boat!"
      else
      end
    end
  end


  # def fire_random_shot
  #   @pla
  #
  # end





end
 # game= GameBoard.new
 # game.place_comp_patrol_boat
 # game.place_comp_destroyer
 # game.print_game_boards
