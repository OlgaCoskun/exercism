class Phrase

  EACH_WORD = (/\w+'?\w+|\d/)

  def initialize(phrase)
    @phrase = phrase
  end

  def word_count
    words.each_with_object(Hash.new(0)) do |word,count|
      count[word] += 1
    end
  end

  private

  attr_reader :phrase

  def words
    @phrase.downcase.scan(EACH_WORD)
  end
end
