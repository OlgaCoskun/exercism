class Squares

  def initialize(number)
    @number = number
  end

  def square_of_sum
    s_of_sum = 0
    1.upto(@number) {|i| s_of_sum += i}
    s_of_sum ** 2
  end

  def sum_of_squares
    1.upto(@number).map { |n| n ** 2}.sum
  end

  def difference
    square_of_sum - sum_of_squares
  end
end
