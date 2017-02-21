module BookKeeping
  VERSION = 2
end

class Anagram
  def initialize(word)
    @word = word.downcase
    @letters = @word.chars.sort
  end

  def match(candidates)
    candidates.select { |w| w.downcase.chars.sort == @letters && w.downcase != @word }
  end
end
