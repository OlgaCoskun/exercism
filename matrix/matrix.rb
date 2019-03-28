class Matrix

  attr_reader :rows, :columns

  def initialize(string)
    @rows = take_rows(string)
    @columns = take_columns
  end

  private

  def take_rows(string)
    string.each_line.map(&:split).map { |row| row.map(&:to_i) }
  end

  def take_columns
    @rows.transpose
  end
end
