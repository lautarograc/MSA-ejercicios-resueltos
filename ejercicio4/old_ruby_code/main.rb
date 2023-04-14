# frozen_string_literal: true

require_relative 'find_check'
require_relative 'file_reader'
def process_board(board)
  white_board = board[0..7]
  black_board = board[8..15]
  # replace cells in white board with letters in black board, but downcase them
  white_board.each_with_index do |row, row_index|
    row.each_char.with_index do |char, col_index|
      black_board[row_index][col_index] = char.downcase if char != '0'
    end
  end
  black_board
end

def main
  input_file = ARGV[0]
  raise 'Usage: ruby main.rb <numbers_file>' if input_file.nil?
  raise "File not found: #{input_file}" unless File.exist?(input_file)

  cases = FileReader.read_cases(input_file)
  cases.each do |current_case, board|
    puts "#{current_case}. #{FindCheck.new(process_board(board)).check? ? 'Hay jaque' : 'No hay jaque'}"
  end
end
main
