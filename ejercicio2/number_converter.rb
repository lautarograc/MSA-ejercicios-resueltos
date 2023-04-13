#require "byebug"
class NumberConverter
  def initialize(data)
    @data = data
  end

  def to_words(number, apocopated = "normal")
    case number
    when 0..9
      if apocopated == "apocopated"
        @data["ones"]["apocopated"]
      else
        @data["ones"]["normal"][number]
      end
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
      suffix =
        number % 100 == 0 ?
          "" :
          if apocopated == "normal"
            " #{to_words(number % 100)}"
          else
            " #{to_words(number % 100, "apocopated")}"
          end
      "#{prefix}#{suffix}"
    when 1000..999_999
      thousands = number / 1000
      prefix =
        (
          if thousands == 21
            "#{@data["twenties"]["apocopated"]} #{@data["thousands"]}"
          elsif [31, 41, 51, 61, 71, 81, 91].include?(thousands % 100)
            #eliminate second word of thousands
            "#{to_words(thousands / 10 * 10)} #{@data["union"]} #{@data["ones"]["apocopated"]} #{@data["thousands"]}"
          elsif thousands % 100 == 21
            "#{@data["hundreds"]["normal"][thousands / 100]} #{@data["twenties"]["apocopated"]} #{@data["thousands"]}"
          elsif thousands != 1
            if thousands % 10 == 1
              "#{to_words(thousands, "apocopated")} #{@data["thousands"]}"
            else
              "#{to_words(thousands)} #{@data["thousands"]}"
            end
          else
            "#{@data["thousands"]}"
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
