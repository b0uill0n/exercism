class SumOfMultiples
  def initialize(*numbers)
    @divisors = numbers
  end

  def to(limit)
    (0...limit).select { |i| @divisors.any? { |d| (i % d).zero? } }.reduce(:+)
  end
end
