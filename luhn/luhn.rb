class Luhn

  DIGITS = /^[0-9]{2,}$/

  attr_reader :number

  def initialize(string)
    @number = string.delete(' ')
  end

  def valid_form?
    number.length > 1 && number =~ DIGITS
  end

  def valid_sum?
    (luhn_sum % 10).zero?
  end

  def luhn_sum
    number.to_i.digits.each_slice(2).sum { |even, odd| even + double_transform(odd.to_i)}
  end

  def double_transform(number)
    (number * 2).digits.sum
  end

  def valid?
    valid_sum? if valid_form?
  end

  def self.valid?(string)
    new(string).valid?
  end
end
