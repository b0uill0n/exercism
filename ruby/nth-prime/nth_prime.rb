class Prime
  @primes = [2, 3]

  def self.nth(number)
    raise ArgumentError if number < 1

    counter = @primes.last

    loop do
      break if @primes.length >= number
      counter += 2
      @primes << counter if prime?(counter)
    end

    @primes[number - 1]
  end

  private

  def self.prime?(number)
    max = Math.sqrt(number)
    @primes.none? do |prime|
      return true if prime > max
      (number % prime).zero?
    end
  end
end

module BookKeeping
  VERSION = 1
end
