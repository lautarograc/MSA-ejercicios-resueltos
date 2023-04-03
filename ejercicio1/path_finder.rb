class PathFinder
  def initialize(map)
    @map = map
  end

  def find_longest_path
    max_path_length = 0
    max_path_item = ""
    @visited = Array.new(@map.length) { Array.new(@map[0].length, false) }

    @map.each_with_index do |row, i|
      row.each_with_index do |item, j|
        if !@visited[i][j]
          stack = [[i, j]]
          path = []

          while !stack.empty?
            curr_i, curr_j = stack.pop
            if !@visited[curr_i][curr_j]
              @visited[curr_i][curr_j] = true
              path << @map[curr_i][curr_j]
              adjacent_tiles = [
                [curr_i - 1, curr_j],
                [curr_i, curr_j - 1],
                [curr_i + 1, curr_j],
                [curr_i, curr_j + 1]
              ]
              adjacent_tiles.each do |row, col|
                if row >= 0 && col >= 0 && row < @map.length &&
                     col < @map[0].length &&
                     @map[row][col] == @map[curr_i][curr_j] &&
                     !@visited[row][col]
                  stack << [row, col]
                end
              end
            end
          end

          if path.length > max_path_length
            max_path_length = path.length
            max_path_item = @map[i][j]
          end
        end
      end
    end

    return "#{max_path_item} #{max_path_length}"
  end
end
