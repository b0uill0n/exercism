module BookKeeping
  VERSION = 4
end

class Complement
  DNA = 'GCTA'
  RNA = 'CGAU'

  def self.dna?(strand)
    strand.each_char.all? { |n| DNA.include?(n) }
  end

  def self.of_dna(strand)
    return '' unless dna?(strand)
    strand.tr(DNA,RNA)
  end
end

