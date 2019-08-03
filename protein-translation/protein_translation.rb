require 'byebug'

module Translation

  CODONS = {'AUG' => 'Methionine',
           'UUU' => 'Phenylalanine',
           'UUC' => 'Phenylalanine',
           'UUA' => 'Leucine',
           'UUG' =>	'Leucine',
           'UCU' => 'Serine',
           'UCC' => 'Serine',
           'UCA' => 'Serine',
           'UCG' => 'Serine',
           'UAU' => 'Tyrosine',
           'UAC' => 'Tyrosine',
           'UGU' => 'Cysteine',
           'UGC' => 'Cysteine',
           'UGG' => 'Tryptophan',
           'UAA' => 'STOP',
           'UAG' => 'STOP',
           'UGA' => 'STOP'}.freeze

  def self.of_codon(codon)
    CODONS[codon]
  end

  def self.of_rna(strand)
    arr_codons = strand.chars.each_slice(3).map(&:join)
    arr_proteins = []
    arr_codons.each do |codon|
      protein = of_codon(codon)
      raise InvalidCodonError unless protein
      break if protein == 'STOP'
      arr_proteins << protein
    end
    arr_proteins
  end
end

class InvalidCodonError < StandardError; end
