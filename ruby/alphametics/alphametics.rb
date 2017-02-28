class Alphametics

  def initialize(puzzle)
    @puzzle = puzzle
    @letters = puzzle.scan(/[A-Z]/).uniq
    @stop = false
    @numerals = (0..9).to_a
    @output = {}
  end

  def self.solve(puzzle)
    Alphametics.new(puzzle).solve
  end

  def solve
    check_equation
    return {} if @stop
    solution.empty? ? {} : @output.merge(@letters.zip(solution).to_h)
  end

  private

  def solution
    f = compile_formula

    @numerals.permutation(@letters.size).each do |digits|
      if f.call(*digits)
        check = @puzzle.tr(@letters.join, digits.join)
        return digits unless check =~ /(\A|\s)0/
      end
    end

    []
  end

  def compile_formula
    terms = @puzzle.split
    params = @letters.join(', ').downcase
    expr = terms.map { |term| compile_word(term) }.join(' ').downcase
    eval("lambda { |%s| %s }" % [params, expr])
  end

  def compile_word(word)
    if word =~ /[A-Z0-9]/
      output = word.chars.reverse.each_with_index.map { |char, i| "#{10**i}*#{char}" }
      "(%s)" % [output.join(' + ')]
    else
      word
    end
  end

  def check_equation
    words = @puzzle.scan(/[A-Z]+/)

    if right_term_larger?(words)
      @output[words[-1][0]] = 1
      @puzzle.tr!(words[-1][0], '1')
      @letters.delete(words[-1][0])
      @numerals.delete(1)
    elsif left_term_larger?(words)
      @stop = true
    end
  end

  def right_term_larger?(words)
    words[0..-2].all? { |word| word.size < words[-1].size }
  end

  def left_term_larger?(words)
    words[0..-2].any? { |word| word.size > words[-1].size }
  end

end

module BookKeeping
  VERSION = 4
end
