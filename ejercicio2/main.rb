require_relative "yaml_loader"
require_relative "file_reader"
require_relative "number_converter"
def main
  data = YamlLoader.load("ejercicio2/numbers.yml")
  input_file = ARGV[0]
  raise "Usage: ruby main.rb <numbers_file>" if input_file.nil?
  raise "File not found: #{input_file}" unless File.exist?(input_file)
  cases = FileReader.read_cases(input_file)
  cases.each do |current_case, number|
    puts "#{current_case}. #{NumberConverter.new(data).to_words(number)}"
  end
end
main
