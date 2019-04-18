class ListOps

  def self.arrays(numbers)
    numbers.size
  end

  def self.reverser(arr)
    arr_rev = []
    (arr.size - 1).downto(0) { |i| arr_rev << arr[i] }
    arr_rev
  end

  def self.concatter(arr1, arr2)
    (arr1 << arr2).flatten!
  end

  def self.mapper(arr)
    result = []
    arr.each do |el|
      result << el + 1
    end
    result
  end

  def self.filterer(arr)
    result = []
    arr.each{ |el| result << el if yield el }
    result
  end

  def self.sum_reducer(arr)
    i = 0
    result = 0
    while i < arr.size
      result += arr[i]
      i += 1
    end
    result
  end

  def self.factorial_reducer(arr)
    result = 1
    1.upto(arr.size) { |el| result *= el }
    result
  end
end
