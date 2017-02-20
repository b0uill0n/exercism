module BookKeeping
  VERSION = 3
end

class Squares
  def initialize(number)
    @number = number
  end

  def square_of_sum
    (1..@number).inject(0) { |sum, n| sum + n }**2
  end

  def sum_of_squares
    (1..@number).inject(0) { |sum, n| sum + n**2 }
  end

  def difference
    square_of_sum - sum_of_squares
  end
end
