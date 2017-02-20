module BookKeeping
  VERSION=1
end

class Trinary
  def initialize(number)
    @number = number
  end

  def to_decimal
    return 0 if @number =~ /[^0-2]/
    @number.each_char.inject(0) {|sum, char| sum * 3 + char.to_i }
  end
end
