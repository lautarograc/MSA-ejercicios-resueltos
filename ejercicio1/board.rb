require_relative "path_finder"
require_relative "output_helper"

class Board
  def initialize(filename, lines = [])
    #lines optional parameter is to mock in testing
    if !File.exist?(filename)
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
        boards << [current_board_name, board] if current_board_name != nil
        current_board_name, board = initialize_board(line)
      elsif !line.empty?
        board << line.split("")
      end
    end

    boards << [current_board_name, board] if current_board_name != nil
    boards
  end

  def initialize_board(line)
    board_name = line[1..-1].strip
    board = []
    [board_name, board]
  end

  def process_boards
    @boards.each do |board_name, board|
      result = PathFinder.new(board).find_longest_path
      puts OutputHelper.new(board_name, result).output_string
    end
  end
end
