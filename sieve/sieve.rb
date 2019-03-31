class Sieve
  def initialize(limit)
    @limit = limit
  end

  def primes
    arr = (2..@limit).to_a
    arr.each do |number|
      arr.reject! { |e| e % number == 0 && e > number }
    end
    arr
  end
end
