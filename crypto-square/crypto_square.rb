require 'byebug'

class Crypto

  def initialize(plaintext)
    @plaintext = plaintext
  end

  def ciphertext
    @no_sym = plaintext.gsub(/\W/,'').downcase

    return plaintext if plaintext.empty?
    return @no_sym if @no_sym.size == 1

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

  private
  attr_reader :plaintext
end
