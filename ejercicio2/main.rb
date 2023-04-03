require_relative "yaml_loader"
require_relative "file_reader"
require_relative "number_converter"

def main
  data = YamlLoader.load("numbers.yml")
  input_file = ARGV[0]
  raise "Usage: ruby main.rb <numbers_file>" if input_file.nil?
  raise "File not found: #{numbers_file}" unless File.exist?(input_file)
  numbers = FileReader.read_numbers(input_file)
  numbers.each { |number| puts NumberConverter.new(data).to_words(number) }
end

main
