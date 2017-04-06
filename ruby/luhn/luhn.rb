class Luhn
  def self.create(number)
    test = number * 10
    luhn = new(test)
    luhn.valid? ? test : test + 10 - (luhn.checksum % 10)
  end

  attr_reader :numbers

  def initialize(number)
    @numbers = number.to_s.chars.map(&:to_i)
  end

  def addends
    output = []
    numbers.each_with_index do |number, index|
      if (numbers.size - index).even?
        double = number * 2
        double -= 9 if double > 9
        output << double
      else
        output << number
      end
    end
    output
  end

  def checksum
    addends.reduce(:+)
  end

  def valid?
    checksum % 10 == 0
  end
end
