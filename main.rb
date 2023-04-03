require_relative "board"

if ARGV.empty?
  puts "Usage: #{$PROGRAM_NAME} <filename>"
  exit
end

filename = ARGV[0]

board = Board.new(filename)
board.process_boards
