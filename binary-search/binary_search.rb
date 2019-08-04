class BinarySearch

  attr_reader :binary

  def initialize(arr)
    @binary = arr
    raise ArgumentError unless arr_is_sorted?(arr)
  end

   def list
     binary
   end

  def arr_is_sorted?(arr)
    arr == arr.sort
  end

  def middle
    binary.index(binary.index(binary.last))
  end

  def search_for(number)
    binary.index(number).nil? ? raise(RuntimeError) : binary.index(number)
  end
end
