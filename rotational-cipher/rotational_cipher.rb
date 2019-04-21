class RotationalCipher
  BIG = ('A'..'Z').to_a.freeze
  SMALL = ('a'..'z').to_a.freeze

  def self.rotate(letters, number)
    letters.tr((BIG + SMALL).join, (BIG.rotate(number) + SMALL.rotate(number)).join)
  end
end
