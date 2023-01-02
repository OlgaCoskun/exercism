=begin
Write your code for the 'Microwave' exercise in this file. Make the tests in
`microwave_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/microwave` directory.
=end
class Microwave

  attr_reader :number

  def initialize(number)
    @number = number
  end

  def timer
    min = number / 100
    sec = number % 100

    while sec >= 60 do
      min += 1
      sec -= 60
    end

    time_format(min, sec)
  end

  def time_format(m, s)
    sprintf("%02d:%02d", m, s)
  end
end
