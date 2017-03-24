module BookKeeping
  VERSION = 1
end

class Triangle
  def initialize(triangle)
    @triangle = triangle
  end

  def equilateral?
    legal_triangle? && @triangle.uniq.size == 1
  end

  def isosceles?
    legal_triangle? && @triangle.uniq.size.between?(1, 2)
  end

  def scalene?
    legal_triangle? && @triangle.uniq.size == 3
  end

  private

  def legal_triangle?
    @triangle.all? { |side| side > 0 } && triangle_inequality?
  end

  def triangle_inequality?
    @triangle.reduce(:+) > @triangle.max * 2
  end
end
