class NumberConverter
  def initialize(data)
    @data = data
  end

  def to_words(number)
    case number
    when 0..9
      @data["ones"]["normal"][number]
    when 10..19
      @data["teens"][number % 10]
    when 20..29
      @data["twenties"]["normal"][number % 10] if number.between?(20, 29)
    when 30..99
      prefix = @data["tens"][number / 10]
      suffix =
        number % 10 == 0 ? "" : " #{@data["union"]} #{to_words(number % 10)}"
      "#{prefix}#{suffix}"
    when 100..999
      prefix =
        (
          if number == 100
            @data["hundreds"]["apocopated"]
          else
            @data["hundreds"]["normal"][number / 100]
          end
        )
      suffix = number % 100 == 0 ? "" : " #{to_words(number % 100)}"
      "#{prefix}#{suffix}"
    when 1000..999_999
      thousands = number / 1000
      prefix =
        (
          if thousands == 21
            "#{@data["twenties"]["apocopated"]} #{@data["thousands"]}"
            #elsif thousands is 31, 41, 51, 61, 71, 81, 91
          elsif [31, 41, 51, 61, 71, 81, 91].include?(thousands)
            #eliminate second word of thousands
            "#{to_words(thousands).split(" ")[0]} #{@data["union"]} #{@data["ones"]["apocopated"]} #{@data["thousands"]}"
          elsif thousands != 1
            "#{to_words(thousands)} #{@data["thousands"]}"
          else
            @data["thousands"]
          end
        )
      suffix =
        if number % 1000 == 0
          ""
        else
          number % 1000 > 99
          " #{to_words(number % 1000)}"
        end
      "#{prefix}#{suffix}"
    when 1_000_000
      "un millon"
    end
  end
end
