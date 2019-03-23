class Array
  def accumulate
    result.each { |el| result.push yield el }
    result
  end
end

# class Array
#   def accumulate
#    map {|value| yield value }
#   end
# end