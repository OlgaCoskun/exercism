class Crypto

  def initialize(plaintext)
    @plaintext = plaintext
  end

  def ciphertext
    @no_sym = plaintext.gsub(/\W/,'').downcase
    no_sym_size = @no_sym.size

    return plaintext if plaintext.empty?
    return @no_sym if no_sym_size == 1

    letters_count = @no_sym.size

    case letters_count
    when 9
      chars_each_slice(3).map(&:join).map(&:chars).transpose.map(&:join).join(' ')
    when 8
      arr = chars_each_slice(3)
      transposes(arr)
    when 54
      arr = chars_each_slice(8)
      transposes(arr)
    end
  end

  def length_arr(arr)
    arr.map(&:length).max
  end

  def transposes(arr)
    arr.map(&:join).map(&:chars).map{|e| e.values_at(0...length_arr(arr))}
        .map { |el| el.map { |ell| ell.nil? ? ' ' : ell }}.transpose.map(&:join).join(' ')
  end

  def chars_each_slice(n)
    @no_sym.chars.each_slice(n)
  end

  protected
  attr_reader :plaintext
end
