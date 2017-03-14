class Palindromes
  Product = Struct.new(:value, :factors)

  attr_reader :largest, :smallest

  def initialize(max_factor:, min_factor: 1)
    @range = (min_factor..max_factor).to_a
  end

  def generate
    palindromes = Hash.new { |h, k| h[k] = [] }

    @range.repeated_combination(2) do |x, y|
      candidate = x * y
      palindromes[candidate] << [x, y] if palindrome?(candidate)
    end

    largest_key = palindromes.keys.max
    @largest = Product.new(largest_key, palindromes[largest_key])

    smallest_key = palindromes.keys.min
    @smallest = Product.new(smallest_key, palindromes[smallest_key])
  end

  private

  def palindrome?(number)
    number.to_s.reverse.to_i == number
  end
end
