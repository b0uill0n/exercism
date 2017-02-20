class PrimeFactors
  def self.for(number)
    result = []
    divisor = 2

    loop do
      break if divisor > number
      if (number % divisor).zero?
        number /= divisor
        result << divisor
      else
        divisor += 1
      end
    end
    result
  end
end
