require 'byebug'

class Transpose
  def self.transpose(input)
    result = []
    input.each_line.with_index do |line, index|
      line.strip.each_char.with_index do |char, i|
        result[i] = "%-#{index}s" % result[i]
        result[i] += char
      end
    end
    result.join("\n")
  end
end
