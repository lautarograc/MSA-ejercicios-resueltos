# frozen_string_literal: true

require_relative "file_reader"
# Define the digital and mirrored numbers

class CompareFigures
  def initialize(figure)
    @figure = figure
  end
  MIRRORED_NUMBERS = [0, nil, 5, nil, nil, 2, nil, 8, nil].freeze
  DIGITAL_NUMBERS = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9].freeze
  def looks_the_same?
    # Convert the number to an array of digits
    digits = @figure.split(":").join("").chars.map(&:to_i)
    # Reverse the digits to get the mirrored figure
    mirrored_digits = digits.reverse.map { |digit| MIRRORED_NUMBERS[digit] }
    # Check if the mirrored figure is equivalent to the original number
    digits == mirrored_digits
  end
end

# Read the input file and check each hour
def main
  input_file = ARGV[0]
  raise "Usage: ruby main.rb <numbers_file>" if input_file.nil?
  raise "File not found: #{input_file}" unless File.exist?(input_file)

  cases = FileReader.read_cases(input_file)
  cases.each do |current_case, hour|
    puts "#{current_case}. #{CompareFigures.new(hour).looks_the_same? ? "Se ve igual" : "No se ve igual"}"
  end
end
main
