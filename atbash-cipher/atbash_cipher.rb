class Atbash

  ALPHABET = ('a'..'z').to_a.join.freeze
  ALPHABET_REVERSE = ALPHABET.reverse.freeze

  def self.encode(text)
    text.gsub(/\W/,'').downcase.tr(ALPHABET, ALPHABET_REVERSE).chars.each_slice(5).map(&:join).join(' ')
  end
end
