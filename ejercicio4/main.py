from find_check import FindCheck
from file_reader import FileReader

def process_board(board):
    white_board = board[0:8]
    black_board = board[8:16]
    # replace cells in white board with letters in black board, but downcase them
    for row_index, row in enumerate(white_board):
        for col_index, char in enumerate(row):
            if char != '0':
                black_board[row_index] = black_board[row_index][:col_index] + char.lower() + black_board[row_index][col_index + 1:]
    return black_board

def main():
    import sys
    input_file = sys.argv[1]
    if input_file is None:
        raise ValueError('Usage: python main.py <numbers_file>')

    cases = FileReader.read_cases(input_file)
    for current_case, board in cases:
        check = FindCheck(process_board(board)).check()
        if check:
            print(f"{current_case}. Hay jaque")
        else:
            print(f"{current_case}. No hay jaque")

if __name__ == "__main__":
    main()
