module BookKeeping
  VERSION = 2
end

module FoodChain
  ANIMALS = {
    1 => ['fly', ''],
    2 => ['spider', "It wriggled and jiggled and tickled inside her.\n",
          " that wriggled and jiggled and tickled inside her.\n"],
    3 => ['bird', "How absurd to swallow a bird!\n"],
    4 => ['cat', "Imagine that, to swallow a cat!\n"],
    5 => ['dog', "What a hog, to swallow a dog!\n"],
    6 => ['goat', "Just opened her throat and swallowed a goat!\n"],
    7 => ['cow', "I don't know how she swallowed a cow!\n"],
    8 => ['horse', "She's dead, of course!"]
  }.freeze

  def self.song
    verses(1, 8)
  end

  def self.verse(number)
    output = "I know an old lady who swallowed a #{ANIMALS[number][0]}.\n"
    output << ANIMALS[number][1]
    return output if ANIMALS.size == number

    (1..number).to_a.reverse.each_cons(2) do |a1, a2|
      output << "She swallowed the #{ANIMALS[a1][0]} to catch the #{ANIMALS[a2][0]}"
      output << (ANIMALS[a2][0] == 'spider' ? ANIMALS[a2][2] : ".\n")
    end

    output << "I don't know why she swallowed the fly. Perhaps she'll die.\n"
  end

  def self.verses(start, stop)
    (start..stop).inject('') { |acc, n| acc << "#{verse(n)}\n" }
  end
end
