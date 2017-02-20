module BookKeeping
  VERSION = 1
end

class Phrase
  attr_reader :word_count

  def initialize(phrase)
    @word_count = Hash.new(0)
    phrase.split(/[\s,]/).each do |word|
      word = word.downcase
        .gsub(/[^a-z0-9']/, '')
        .gsub(/^'(.+)'$/, '\1')
      @word_count[word] += 1 if word != ''
    end
  end
end
