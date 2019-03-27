class Isogram
  def self.isogram?(text)
    phrase = text.downcase.scan(/[[:alpha:]]/)
    phrase.length == phrase.uniq.length
  end
end
