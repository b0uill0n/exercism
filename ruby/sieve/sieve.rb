class Sieve
  def initialize(number)
    @number = number
  end

  def primes
    @number.equal?(1) ? [] : calc_primes
  end

  private

  def calc_primes
    primes = (2..@number).to_a

    primes.each do |i|
      break if i**2 > @number
      (i**2..@number).step(i).each { |j| primes.delete(j) }
    end

    primes
  end
end
