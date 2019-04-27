class Crypto

  def initialize(plaintext)
    @plaintext = plaintext
  end

  def ciphertext
    @no_sym = plaintext.gsub(/\W/,'').downcase

    return plaintext if plaintext.empty?

    @no_sym.size == 1 ? @no_sym : not_equal_one
  end

  def not_equal_one
    arr = chars_each_slice(rectangle_size - 1)
    transposes(arr)
  end

  def upper_bound(arr)
    arr.map(&:length).max
  end

  def transposes(arr)
    arr.map(&:join).map(&:chars).map{|e| e.values_at(0...upper_bound(arr))}
        .map { |el| el.map { |ell| ell.nil? ? ' ' : ell }}.transpose.map(&:join).join(' ')
  end

  def chars_each_slice(n)
    @no_sym.chars.each_slice(n)
  end

  def rectangle_size
    Math.sqrt(@plaintext.length).ceil
  end

  protected
  attr_reader :plaintext
end
