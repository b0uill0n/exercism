module BookKeeping
  VERSION = 1
end

class Grains
  def self.square(number)
    raise ArgumentError unless number.between?(1, 64)
    2**(number -1)
  end

  def self.total
    (2**64) - 1
  end
end
