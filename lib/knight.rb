require_relative('board.rb')

class Knight
  attr_accessor :graph, :graph_hash

  def initialize(start)
    @start = start
    @board = Board.new.board_squares
    @graph = move_graph
    @graph_hash = nodes_to_hash
  end

  def move_graph
    hash = []
    @board.each do |square|
      hash << MoveNode.new(square)
    end
    hash
  end

  def nodes_to_hash
    graph = {}
    @graph.each do |node|
      graph[node.square] = node.jump_squares
    end
    graph
  end

  def search(start, target, graph = @graph_hash)
    queue = [start]
    visited = {start => true}
    parent = {}
    
    while !queue.empty?
      current = queue.shift

      if current == target
        path = [current]
        while parent[current]
          path.unshift(parent[current])
          current = parent[current]
        end
        return path
      end

      graph[current].each do |neighbor|
        if !visited[neighbor]
          visited[neighbor] = true
          parent[neighbor] = current
          queue << neighbor
        end
      end

    end
    return nil

  end

  def find_node(square)
    @graph.select { |node| node.square == square }[0]
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


test_knight = Knight.new([0, 0])
p test_knight.search([0,1], [6,3])