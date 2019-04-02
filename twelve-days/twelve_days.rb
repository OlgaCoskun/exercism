require 'byebug'
require 'pry-byebug'

class TwelveDays

  DAYS = ["first", "second", "third", "fourth", "fifth", "sixth", "seventh", "eighth", "ninth", "tenth", "eleventh", "twelfth"].freeze

  GIFTS = ["a Partridge in a Pear Tree",
           "two Turtle Doves",
           "three French Hens",
           "four Calling Birds",
           "five Gold Rings",
           "six Geese-a-Laying",
           "seven Swans-a-Swimming",
           "eight Maids-a-Milking",
           "nine Ladies Dancing",
           "ten Lords-a-Leaping",
           "eleven Pipers Piping",
           "twelve Drummers Drumming"
  ].freeze

  def self.verse(num)
    "On the #{DAYS[num]} day of Christmas my true love gave to me: #{presents(num)}."
  end

  def self.presents(num)
    *all, last = get_presents(num)
    num.zero? ? last : all.join(', ') + ", and #{last}"
  end

  def self.get_presents(num)
    (0..num).to_a.reverse.map{ |n| GIFTS[n] }
  end

  def self.song
    (0..11).map(&method(:verse)).join("\n\n") << "\n"
  end
end
