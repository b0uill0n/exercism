module BookKeeping
  VERSION = 1
end

class WordProblem
   OPERATORS = {
      'plus' => '+',
      'minus' => '-',
      'multiplied by' => '*',
      'divided by' => '/'
    }

  attr_reader :answer

  def initialize(question)
    expression = convert(question)
    @answer = calculate(expression)
  end

  private

  def convert(string)
    output = string.
      sub(/What\sis\s/, '').
      sub(/\?/, '')

    OPERATORS.each_key do |operator|
      output.gsub!(operator, OPERATORS[operator])
    end

    raise ArgumentError if output =~ /[^ +\d\/*-]/
    output.split.map { |s| s =~ /\d/ ? s.to_i : s }
  end

  def calculate(expression)
    expression[1..-1].each_slice(2).inject(expression[0]) do |sum, (operator, number)|
      sum.send(operator, number)
    end
  end
end
