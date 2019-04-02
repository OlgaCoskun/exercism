class Triangle

  attr_reader :arr

  def initialize(arr)
    @arr = arr
  end

  def equilateral?
    arr.uniq! && arr.size == 1 && arr[0] != 0
  end

  def isosceles?
    arr.uniq!
    !arr.include?(1) && arr.size == 2 || arr.size == 1
  end

  def scalene?
    arr.uniq!
    if arr.size == 1 || arr.size == 2
      false
    else
      arr.sort!
      arr[0] + arr[1] > arr[2] && arr.size == 3
    end
  end
end
