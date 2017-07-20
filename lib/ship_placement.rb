# require 'simplecov'
# SimpleCov.start
module ShipPlacement

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

  def assign_comp_patrol_boat_keys
    key1 = comp_random_key
    key2 = new_tile_key(key1)
    while test_params(key1) == false || test_params(key2) == false
      key1 = comp_random_key
      key2 = new_tile_key(key1)
    end
    keys = [key1, key2]
  end

  def place_comp_patrol_boat
    keys = assign_comp_patrol_boat_keys
    @computer_game_board[keys[0]].occupied
    @computer_game_board[keys[1]].occupied
    @computer_patrol_boat = [@computer_game_board[keys[0]], @computer_game_board[keys[1]]]
  end

  def test_patrol_boat_valid(key1, key2)
    key1 = key1.to_s.split('')
    key2 = key2.to_s.split('')

    if key1[0] == key2[0]
      if (key1[1].to_i - key2[1].to_i) == 1 || (key1[1].to_i - key2[1].to_i) == -1
        true
      else
        false
      end
    elsif key1[1] == key2[1]
      if key1[0].next == key2[0] || (key1[0].ord-1).chr == key2[0]
        return true
      else
        return false
      end
    else
      return false
    end
  end

  def place_player_patrol_boat(coord1, coord2)
    key1 = coord1.to_sym
    key2 = coord2.to_sym
    if test_patrol_boat_valid(key1, key2) == false
      return "Not Valid Coordinates, Enter Coodinates next to each other (A2 A3)"
    end
    if test_player_params(key1) == false || test_player_params(key2) == false
      return "Not Valid Coordinates, Enter between A1 at the top left and D4 at the bottom right."
    end
    @player_game_board[key1].occupied
    @player_game_board[key2].occupied
    @player_patrol_boat = [@player_game_board[key1], @player_game_board[key2]]
    "done"
  end

  def test_destroyer_valid(key1, key3)
    key1 = key1.to_s.split('')
    key2 = key3.to_s.split('')

    if key1[0] == key2[0]
      if (key1[1].to_i - key2[1].to_i) == 2 || (key1[1].to_i - key2[1].to_i) == -2
        true
      else
        false
      end
    elsif key1[1] == key2[1]
      if key1[0].next.next == key2[0] || (key1[0].ord-2).chr == key2[0]
        return true
      else
        return false
      end
    else
      return false
    end
  end

  def place_player_destroyer(coord1, coord2)
    key1 = coord1.to_sym
    key3 = coord2.to_sym
    key2 = find_middle_key(key1, key3)
    if test_destroyer_valid(key1, key3) == false
      return "Not Valid Coordinates, Enter Coodinates at each end (A2 C2)"
    end
    if test_player_params(key1) == false || test_player_params(key2) == false || test_player_params(key3) == false
      return "Not Valid Coordinates, Please try again"
    end
    @player_game_board[key1].occupied
    @player_game_board[key2].occupied
    @player_game_board[key3].occupied
    @player_destroyer = [@player_game_board[key1], @player_game_board[key2], @player_game_board[key3]]
    "done"
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

  def test_comp_destroyer_params(key1, key2, key3)
    while test_params(key1) == false || test_params(key2) == false || test_params(key3) == false
      key1 = comp_random_key
      key2 = new_tile_key(key1)
      key3 = third_key_for_destroyer(key1, key2)
    end
    [key1, key2, key3]
  end

  def assign_comp_destroyer_keys
    key1 = comp_random_key
    key2 = new_tile_key(key1)
    key3 = third_key_for_destroyer(key1, key2)
    test_comp_destroyer_params(key1, key2, key3)
  end

  def place_comp_destroyer
    keys = assign_comp_destroyer_keys
    @computer_game_board[keys[0]].occupied
    @computer_game_board[keys[1]].occupied
    @computer_game_board[keys[2]].occupied
    @computer_destroyer = [@computer_game_board[keys[0]], @computer_game_board[keys[1]], @computer_game_board[keys[2]]]
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
end
