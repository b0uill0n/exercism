class Series
  def initialize(digits)
    @digits = digits
  end

  def slices(size)
    raise ArgumentError if size > @digits.length
    @digits.chars.each_cons(size).map(&:join)
  end
end
