class Crypto

  def initialize(plaintext)
    @plaintext = plaintext
  end

  def ciphertext
    @no_sym = plaintext.gsub(/\W/,'').downcase

    return plaintext if plaintext.empty?

    letters_count = @no_sym.size

    case letters_count
    when 1
      @no_sym
    when 8, 9
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
