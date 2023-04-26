# frozen_string_literal: true

require "minitest/autorun"
require_relative "board"

class BoardTest < Minitest::Test
  def setup
    @valid_filename = "ejercicio1/test.txt"
  end

  def test_initialize_with_valid_file
    board = Board.new(@valid_filename)
    assert_instance_of Board, board
  end

  def test_output_with_valid_file
    board = Board.new(@valid_filename)
    assert_output("1: (\"B\", 8)\n2: (\"C\", 10)\n3: (\"A\", 10100)\n") do
      board.process_boards
    end
  end
end
