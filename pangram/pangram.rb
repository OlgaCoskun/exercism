module Pangram
  def self.pangram?(words)
    'abcdefghijklmnopqrstuvwxyz'.each_char.all? { |letter| words.downcase.include? letter }
  end
end