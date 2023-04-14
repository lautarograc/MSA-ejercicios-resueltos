# frozen_string_literal: true

class FindCheck
  def initialize(board)
    @board = board
  end

  def find_king(board, piece)
    board.each_with_index do |row, row_index|
      col_index = row.index(piece)
      return row_index, col_index if col_index
    end
    nil
  end

  def piece_color(piece)
    piece == piece.upcase ? :white : :black
  end

  def pawn_check?(_pawn, row_index, col_index, king)
    potential_checks = [
      [row_index - 1, col_index - 1],
      [row_index - 1, col_index + 1]
    ]
    return true if potential_checks.include?(king)
  end

  def knight_check?(_piece, row_index, col_index, king)
    # Check if the king is in a knight's move away from the piece
    potential_checks = [
      [row_index - 2, col_index - 1],
      [row_index - 2, col_index + 1],
      [row_index - 1, col_index - 2],
      [row_index - 1, col_index + 2],
      [row_index + 1, col_index - 2],
      [row_index + 1, col_index + 2],
      [row_index + 2, col_index - 1],
      [row_index + 2, col_index + 1]
    ]
    return true if potential_checks.include?(king)

    false
  end

  def diagonal_check?(_piece, row_index, col_index, king)
    # Check if the king is on a diagonal path from the piece
    king_row, king_col = king
    return false unless (row_index - king_row).abs == (col_index - king_col).abs

    # Check if the path is clear of any other pieces
    x_dir = king_col > col_index ? 1 : -1
    y_dir = king_row > row_index ? 1 : -1
    x = col_index + x_dir
    y = row_index + y_dir
    while x != king_col
      return false if @board[y][x] != '0'

      x += x_dir
      y += y_dir
    end

    true
  end

  def vertical_check?(_piece, row_index, col_index, king)
    # Check if the king is on a vertical path from the piece
    king_row, king_col = king
    return false unless col_index == king_col

    # Check if the path is clear of any other pieces
    y_dir = king_row > row_index ? 1 : -1
    y = row_index + y_dir
    while y != king_row
      return false if @board[y][col_index] != '0'

      y += y_dir
    end

    true
  end

  def horizontal_check?(_piece, row_index, col_index, king)
    # Check if the king is on a horizontal path from the piece
    king_row, king_col = king
    return false unless row_index == king_row

    # Check if the path is clear of any other pieces
    x_dir = king_col > col_index ? 1 : -1
    x = col_index + x_dir
    while x != king_col
      return false if @board[row_index][x] != '0'

      x += x_dir
    end

    true
  end

  def check?
    white_king = find_king(@board, 'R')
    black_king = find_king(@board, 'r')
    @board.each_with_index do |row, row_index|
      row.each_char.with_index do |piece, col_index|
        king = piece_color(piece) == :white ? black_king : white_king
        next if %w[0 R r].include?(piece)

        case piece
        when 'P', 'p'
          return true if pawn_check?(piece, row_index, col_index, king)
        when 'A', 'a'
          return true if diagonal_check?(piece, row_index, col_index, king)
        when 'D', 'd'
          if diagonal_check?(piece, row_index, col_index, king) ||
             vertical_check?(piece, row_index, col_index, king) ||
             horizontal_check?(piece, row_index, col_index, king)
            return true
          end
        when 'T', 't'
          if vertical_check?(piece, row_index, col_index, king) ||
             horizontal_check?(piece, row_index, col_index, king)
            return true
          end
        when 'C', 'c'
          return true if knight_check?(piece, row_index, col_index, king)
        end
      end
    end
    false
  end
end
