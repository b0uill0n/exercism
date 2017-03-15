module BookKeeping
  VERSION = 3
end

module Brackets
  BRACKETS = {
    ']' => '[',
    '}' => '{',
    ')' => '('
  }.freeze

  def self.paired?(input)
    queue = []

    input.scan(/[\[\]\{\}\(\)]/).each do |b|
      if BRACKETS.keys.include?(b)
        return false if queue.empty? || queue.pop != BRACKETS[b]
      elsif BRACKETS.values.include?(b)
        queue << b
      end
    end

    queue.empty?
  end
end
