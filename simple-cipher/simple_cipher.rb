=begin
Write your code for the 'Simple Cipher' exercise in this file. Make the tests in
`simple_cipher_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/simple-cipher` directory.
=end

class Cipher
  attr_reader :key

  LETTERS = ('a'..'z').to_a
  ALPHABET = ('a'..'z').each_with_index.map { |l, i| [l, i] }.to_h
  KEY = /\A[a-z]+\z/

  def initialize(key = nil)
    key ||= LETTERS.sample * 10
    raise ArgumentError unless key =~ KEY
    @key = key
  end

  def encode(pl)
    result = []
    pl.split("").each_with_index { |l, i| result << ALPHABET.key(((ALPHABET[l] + ALPHABET[key[i]])) % ALPHABET.size) }
    result.join("")
  end

  def decode(cp)
    result = []
    cp.split("").each_with_index { |l, i| result << ALPHABET.key(((ALPHABET[l] - ALPHABET[key[i]]) % ALPHABET.size)) }
    result.join("")
  end
end
