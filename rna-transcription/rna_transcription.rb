class Complement
  DNA_TO_RNA = {
      'G' => 'C',
      'C' => 'G',
      'T' => 'A',
      'A' => 'U'
  }.freeze

  RNA_TO_DNA = DNA_TO_RNA.invert.freeze

  def self.of_dna(dna)
    find_complement(dna, DNA_TO_RNA)
  end

  def self.of_rna(rna)
    find_complement(rna, RNA_TO_DNA)
  end

  def self.find_complement(line, nucleotide_cheme)
    line.each_char.map do |n|
      nucleotide_cheme.fetch(n)
    end.join
  end
end