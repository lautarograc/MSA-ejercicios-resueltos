class FileReader
    def self.read_numbers(file_path)
      numbers = []
      File.open(file_path).each do |line|
        if line.start_with?("#")
          next
        elsif !line.strip.empty?
          numbers << line.strip.to_i
        end
      end
      numbers
    end
  end
  