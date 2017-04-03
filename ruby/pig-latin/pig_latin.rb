class PigLatin
  def self.translate(text)
    text.split.map { |word| new(word).translate }.join(' ')
  end

  attr_reader :word

  def initialize(word)
    @word = word
  end

  def translate
    if word =~ /\A([aeiou]|y[^aeiou]|xr)/
      word + 'ay'
    else
      first, remainder = word.scan(/\A([^aeiou]?qu|[^aeiou]+)(.*)/).first
      remainder + first + 'ay'
    end
  end
end
