class FindCheck:
    def __init__(self, board):
        self.board = board

    def find_king(self, board, piece):
        for row_index, row in enumerate(board):
            col_index = row.find(piece)
            if col_index != -1:
                return row_index, col_index
        return None

    def piece_color(self, piece):
        return "white" if piece == piece.upper() else "black"

    def pawn_check(self, pawn, row_index, col_index, king):
        potential_checks = [
            (row_index - 1, col_index - 1),
            (row_index - 1, col_index + 1)
        ]
        return king in potential_checks

    def knight_check(self, piece, row_index, col_index, king):
        potential_checks = [
            (row_index - 2, col_index - 1),
            (row_index - 2, col_index + 1),
            (row_index - 1, col_index - 2),
            (row_index - 1, col_index + 2),
            (row_index + 1, col_index - 2),
            (row_index + 1, col_index + 2),
            (row_index + 2, col_index - 1),
            (row_index + 2, col_index + 1)
        ]
        return king in potential_checks

    def diagonal_check(self, piece, row_index, col_index, king):
        king_row, king_col = king
        if abs(row_index - king_row) != abs(col_index - king_col):
            return False
        x_dir = 1 if king_col > col_index else -1
        y_dir = 1 if king_row > row_index else -1
        x, y = col_index + x_dir, row_index + y_dir
        while x != king_col:
            if self.board[y][x] != "0":
                return False
            x += x_dir
            y += y_dir
        return True

    def vertical_check(self, piece, row_index, col_index, king):
        if king is None:
            return False
        king_row, king_col = king
        if col_index != king_col:
            return False
        y_dir = 1 if king_row > row_index else -1
        y = row_index + y_dir
        while y != king_row:
            if self.board[y][col_index] != "0":
                return False
            y += y_dir
        return True

    def horizontal_check(self, piece, row_index, col_index, king):
        if king is None:
            return False
        king_row, king_col = king
        if row_index != king_row:
            return False
        x_dir = 1 if king_col > col_index else -1
        x = col_index + x_dir
        while x != king_col:
            if self.board[row_index][x] != "0":
                return False
            x += x_dir
        return True

    def check(self):
        white_king = self.find_king(self.board, "R")
        black_king = self.find_king(self.board, "r")
        for row_index, row in enumerate(self.board):
            for col_index, piece in enumerate(row):
                king = black_king if self.piece_color(piece) == "white" else white_king
                if piece not in ["0", "R", "r"]:
                    if piece in ["P", "p"] and self.pawn_check(piece, row_index, col_index, king):
                        return True
                    elif piece in ["A", "a"] and self.diagonal_check(piece, row_index, col_index, king):
                        return True
                    elif piece in ["C", "c"] and self.knight_check(piece, row_index, col_index, king):
                        return True
                    elif piece in ["T", "t"] and (self.vertical_check(piece, row_index, col_index, king) or self.horizontal_check(piece, row_index, col_index, king)):
                        return True
                    elif piece in ["D", "d"] and (self.diagonal_check(piece, row_index, col_index, king) or self.vertical_check(piece, row_index, col_index, king) or self.horizontal_check(piece, row_index, col_index, king)):
                        return True
        return False

