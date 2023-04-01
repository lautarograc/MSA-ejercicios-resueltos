class PathFinder
  def initialize(map)
    @map = map
    @visited = Array.new(@map.length) { Array.new(@map[0].length, false) }
  end
  def find_longest_path
    max_path_length = 0
    max_path_item = ""

    @visited = Array.new(@map.length) { Array.new(@map[0].length, false) }

    @map.each_with_index do |row, i|
      row.each_with_index do |item, j|
        if !@visited[i][j]
          path = []
          create_path(i, j, path)

          if path.length > max_path_length
            max_path_length = path.length
            max_path_item = @map[i][j]
          end
        end
      end
    end

    return "#{max_path_item} #{max_path_length}"
  end
  def create_path(i, j, path)
    @visited[i][j] = true
    path << @map[i][j]

    adjacent_tiles = [[i - 1, j], [i, j - 1], [i + 1, j], [i, j + 1]]

    adjacent_tiles.each do |row, col|
      if row >= 0 && col >= 0 && row < @map.length && col < @map[0].length &&
           @map[row][col] == @map[i][j] && !@visited[row][col]
        create_path(row, col, path)
      end
    end
  end
end
