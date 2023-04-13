#rspec

require_relative "number_converter"
require_relative "yaml_loader"

describe NumberConverter do
  let(:data) { YamlLoader.load("ejercicio2/numbers.yml") }
  let(:number_converter) { NumberConverter.new(data) }
  let(:compare) { File.readlines("ejercicio2/all_numbers.txt") }

  context "when compared to the file" do
    it "converts the numbers correctly" do
      count = 1
      compare.each do |word|
        expect(number_converter.to_words(count)).to eq(
          word.strip.gsub(
            /[áéíóú]/,
            "á" => "a",
            "é" => "e",
            "í" => "i",
            "ó" => "o",
            "ú" => "u"
          )
        )
        count += 1
      end
    end
  end
end
