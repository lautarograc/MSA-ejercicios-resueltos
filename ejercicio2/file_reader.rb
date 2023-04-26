class FileReader
  def self.read_cases(file_path)
    cases = []
    current_case = nil
    File
      .open(file_path)
      .each do |line|
        if line.start_with?("#")
          current_case = line[/\d+/].to_i
        elsif !line.strip.empty?
          cases << [current_case, line.strip.to_i]
        end
      end
    cases
  end
end
