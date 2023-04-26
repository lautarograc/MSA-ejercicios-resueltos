# Define the digital and mirrored numbers
class CompareFigures:
  def __init__(self, figure):
      self.figure = figure

  MIRRORED_NUMBERS = [0, None, 5, None, None, 2, None, None, 8, None]
  DIGITAL_NUMBERS = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]

  def looks_the_same(self):
      # Convert the number to an array of digits
      digits = list(map(int, self.figure.replace(":", "")))
      # Reverse the digits to get the mirrored figure
      mirrored_digits = [CompareFigures.MIRRORED_NUMBERS[digit] for digit in reversed(digits)]
      # Check if the mirrored figure is equivalent to the original number
      return digits == mirrored_digits

# Read the input file and check each element
def main():
  import sys
  from file_reader import FileReader

  input_file = sys.argv[1]
  if input_file is None:
      raise Exception("Usage: python main.py <numbers_file>")
  cases = FileReader.read_cases(input_file)
  for current_case, hour in cases:
      print(f"{current_case}. {'Se ve igual' if CompareFigures(hour).looks_the_same() else 'No se ve igual'}")

if __name__ == '__main__':
  main()
