class Series

  def initialize(numbers)
    @numbers = numbers.chars
  end

  def slices(length_of_slices)
    raise ArgumentError if length_of_slices > @numbers.size

    @numbers.each_cons(length_of_slices).map(&:join)
  end
end