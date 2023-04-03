class OutputHelper
  def initialize(board_name, result)
    @board_name = board_name
    @result = result
  end

  def output_string
    @@case_number = @board_name.delete("case ").to_i
    return(
      "#{@@case_number}: \(\"#{@result.split.first}\", #{@result.split.last}\)"
    )
  end
end
