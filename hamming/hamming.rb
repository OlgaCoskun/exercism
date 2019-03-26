class Hamming
  def self.compute(dna1, dna2)
    raise ArgumentError unless dna1.length == dna2.length

    (0...dna1.length).count do |i|
      dna1[i] != dna2[i]
    end
  end
end