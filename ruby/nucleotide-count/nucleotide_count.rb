class Nucleotide
  def self.from_dna(dna)
    raise ArgumentError if dna =~ /[^ACGT]/
    new(dna)
  end

  def initialize(dna)
    @dna = dna.chars
  end

  def count(nucleotide)
    @dna.count(nucleotide)
  end

  def histogram
    @dna.each_with_object(Hash['A', 0, 'C', 0, 'G', 0, 'T', 0]) { |n, h| h[n] += 1 }
  end
end
