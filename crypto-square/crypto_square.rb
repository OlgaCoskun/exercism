class Crypto

  def initialize(plaintext)
    @plaintext = plaintext
  end

  def ciphertext
    no_sym = plaintext.gsub(/\W/,'').downcase
    no_sym_size = no_sym.size

    return plaintext if plaintext.empty?
    return no_sym if no_sym_size == 1

    letters_count = no_sym.size

    case letters_count
    when 9
      no_sym.chars.each_slice(3).map(&:join).map(&:chars).transpose.map(&:join).join(' ')
    when 8
      arr = no_sym.chars.each_slice(3).map(&:join).map(&:chars)
      arr.map{|e| e.values_at(0...length_arr(arr))}.map { |el| el.map { |ell| ell.nil? ? ' ' : ell }}.transpose.map(&:join).join(' ')
    when 54
      arr = no_sym.chars.each_slice(8).map(&:join).map(&:chars)
      arr.map{|e| e.values_at(0...length_arr(arr))}.map { |el| el.map { |ell| ell.nil? ? ' ' : ell }}.transpose.map(&:join).join(' ')
    end
  end

  def length_arr(arr)
    arr.map(&:length).max
  end

  protected
  attr_reader :plaintext
end
