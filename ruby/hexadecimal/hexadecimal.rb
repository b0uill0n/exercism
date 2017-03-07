class Hexadecimal
  Hexadecimal = {
    "0" => 0,
    "1" => 1,
    "2" => 2,
    "3" => 3,
    "4" => 4,
    "5" => 5,
    "6" => 6,
    "7" => 7,
    "8" => 8,
    "9" => 9,
    "a" => 10,
    "b" => 11,
    "c" => 12,
    "d" => 13,
    "e" => 14,
    "f" => 15
  }.freeze

  def initialize(number)
    @number = number.chars
  end

  def to_decimal
    return 0 unless @number.all? { |c| Hexadecimal.key?(c) }
    @number.each.inject(0) { |sum, char| sum * 16 + Hexadecimal[char] }
  end
end
