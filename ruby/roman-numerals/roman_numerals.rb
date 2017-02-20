module BookKeeping
  VERSION = 2
end

module Roman
  NUMERALS = {
    M: 1000,
    CM: 900,
    D: 500,
    CD: 400,
    C: 100,
    XC: 90,
    L: 50,
    XL: 40,
    X: 10,
    IX: 9,
    V: 5,
    IV: 4,
    I: 1
  }.freeze

  def to_roman
    remainder = self
    result = ''

    NUMERALS.each do |roman, arabic|
      result << roman.to_s * (remainder / arabic)
      remainder = remainder % arabic
    end

    result
  end
end

class Integer
  include Roman
end
