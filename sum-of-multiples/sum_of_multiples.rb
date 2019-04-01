class SumOfMultiples

  attr_reader :multiples

  def initialize(*multiples)
    @multiples = multiples
  end

  def to(limit)
    (1...limit).select { |n| multiples?(n) }.sum
  end

  def multiples?(n)
    multiples.any? { |m| (n % m).zero? }
  end
end
