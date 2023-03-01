# require board.rb

class Knight
  def initialize(start)
    @start = start
  end

  def move_tree(start = @start)

  end
end

class MoveNode
  attr_accessor :square, :jump_squares
  def initialize(square)
    @square = square
    @jump_squares = possible_moves
  end

  def possible_moves(square = @square)
    move_array = []

    result = [square[0] + 1, square[1] + 2]
    move_array << result unless out_of_bounds?(result)

    result = [square[0] + 1, square[1] - 2]
    move_array << result unless out_of_bounds?(result)

    result = [square[0] - 1, square[1] + 2]
    move_array << result unless out_of_bounds?(result)

    result = [square[0] - 1, square[1] - 2]
    move_array << result unless out_of_bounds?(result)

    result = [square[0] + 2, square[1] + 1]
    move_array << result unless out_of_bounds?(result)

    result = [square[0] + 2, square[1] - 1]
    move_array << result unless out_of_bounds?(result)

    result = [square[0] - 2, square[1] + 1]
    move_array << result unless out_of_bounds?(result)

    result = [square[0] - 2, square[1] - 1]
    move_array << result unless out_of_bounds?(result)
    
    return move_array
  end

  def out_of_bounds?(square)
    if square[0] > 7 || square[1] > 7
      return true
    elsif square[0] < 0 || square[1] < 0
      return true
    end
    return false
  end
end

test_node = MoveNode.new([6,2])
p test_node.jump_squares