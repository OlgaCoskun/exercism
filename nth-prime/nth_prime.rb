class Prime
  def self.nth(n)
    raise ArgumentError if n < 1
    primes = []
    2.step do |i|
      primes.push i if primes.none? do |candidate|
        break true if candidate**2 > i
        (i % candidate).zero?
      end
      return i if primes.size == n
    end
  end
end
