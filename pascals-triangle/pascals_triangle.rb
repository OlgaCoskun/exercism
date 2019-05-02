class Triangle

  def initialize(num)
    @num = num
  end

  def pascals_triangle(row = [1])
    current = row
    Enumerator.new do |y|
      loop do
        y << current
        current = pascals_row(current)
      end
    end
  end

  def pascals_row(row)
    ([0] + row).zip(row + [0]).collect { |a, b| a + b }
  end

  def rows
    arr = []
    pascals_triangle.with_index(1).take(num).map { |row, i| arr << row }
    arr
  end

  private

  attr_reader  :num
end
