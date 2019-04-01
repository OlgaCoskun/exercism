class Array
  def keep
    result = []
    each { |el| result << el if yield el }
    result
  end

  def discard
    result = []
    each { |el| result << el unless yield el }
    result
  end
end
