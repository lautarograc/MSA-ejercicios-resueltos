# frozen_string_literal: true

class Board
  def initialize(filename, lines = [])
    # lines optional parameter is to mock in testing
    unless File.exist?(filename)
      puts "Error: file '#{filename}' does not exist"
      exit
    end
    lines = File.readlines(filename).map(&:strip) if lines.empty?
    @boards = process_lines(lines)
  end

  def process_lines(lines)
    boards = []
    board = []
    current_board_name = nil

    lines.each do |line|
      if line.start_with?("#")
        boards << [current_board_name, board] unless current_board_name.nil?
        current_board_name, board = initialize_board(line)
      elsif !line.empty?
        board << line.split("")
      end
    end

    boards << [current_board_name, board] unless current_board_name.nil?
    boards
  end

  def initialize_board(line)
    board_name = line[1..].strip
    board = []
    [board_name, board]
  end

  def process_boards
    @boards.each do |board_name, board|
      result = find_longest_board(board)
      puts output_string(board_name, result)
    end
  end

  private

  def find_longest_board(map)
    max_board_length = 0
    max_board_item = ""
    visited = Array.new(map.length) { Array.new(map[0].length, false) }

    map.each_with_index do |row, i|
      row.each_with_index do |_item, j|
        next if visited[i][j]

        stack = [[i, j]]
        board_length = 0

        until stack.empty?
          curr_i, curr_j = stack.pop
          next if visited[curr_i][curr_j]

          visited[curr_i][curr_j] = true
          board_length += 1
          adjacent_tiles = [
            [curr_i - 1, curr_j],
            [curr_i, curr_j - 1],
            [curr_i + 1, curr_j],
            [curr_i, curr_j + 1]
          ]
          adjacent_tiles.each do |next_i, next_j|
            unless next_i >= 0 && next_i < map.length && next_j >= 0 &&
                     next_j < map[next_i].length &&
                     map[next_i][next_j] == map[curr_i][curr_j]
              next
            end

            stack << [next_i, next_j]
          end
        end

        if board_length > max_board_length
          max_board_length = board_length
          max_board_item = map[i][j]
        end
      end
    end

    "#{max_board_item} #{max_board_length}"
  end

  def output_string(board_name, result)
    case_number = board_name.delete("case ").to_i
    "#{case_number}: \(\"#{result.split.first}\", #{result.split.last}\)"
  end
end
