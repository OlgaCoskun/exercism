require 'byebug'

class Crypto

  def initialize(plaintext)
    @plaintext = plaintext
  end

  def ciphertext
    @no_sym = plaintext.gsub(/\W/,'').downcase

    return plaintext if plaintext.empty?
    return @no_sym if @no_sym.size == 1

    transposes(rectangle_size - 1)
  end

  def transposes(n)
    @no_sym.chars.each_slice(n).map {|x| Array.new(n) {|a| x[a] || " " } }.transpose.map(&:join).join(' ')
  end

  def rectangle_size
    Math.sqrt(@plaintext.length).ceil
  end

  private
  attr_reader :plaintext
end
