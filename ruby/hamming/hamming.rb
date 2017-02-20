class Hamming
  def self.compute(strand1, strand2)
    raise ArgumentError if strand1.length != strand2.length

    amount_of_mutation = 0

    for n in 0...strand1.length
      amount_of_mutation += 1 if strand1[n] != strand2[n]
    end

    amount_of_mutation
  end
end

module BookKeeping
  VERSION = 3
end
