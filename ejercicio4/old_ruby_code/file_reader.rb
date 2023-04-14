# frozen_string_literal: true

class FileReader
  def self.read_cases(file_path)
    cases = Hash.new { |hash, key| hash[key] = [] }
    current_case = nil
    File
      .open(file_path)
      .each do |line|
        if line.start_with?('#')
          current_case = line[/\d+/].to_i
        elsif !line.strip.empty?
          cases[current_case] << line.strip # Add the current case to the hash for the current_case number
        end
      end
    cases.to_a
  end
end
