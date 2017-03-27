module House
  PHRASES = {
    1 => ['lay in', "house that Jack built.\n"],
    2 => ['ate', "malt\n"],
    3 => ['killed', "rat\n"],
    4 => ['worried', "cat\n"],
    5 => ['tossed', "dog\n"],
    6 => ['milked', "cow with the crumpled horn\n"],
    7 => ['kissed', "maiden all forlorn\n"],
    8 => ['married', "man all tattered and torn\n"],
    9 => ['woke', "priest all shaven and shorn\n"],
    10 => ['kept', "rooster that crowed in the morn\n"],
    11 => ['belonged to', "farmer sowing his corn\n"],
    12 => ['', "horse and the hound and the horn\n"]
  }.freeze

  def self.recite
    "#{(1..PHRASES.size).map { |n| verse(n) }.join("\n")}"
  end

  def self.verse(number)
    output = ''
    first_line = true

    number.downto(1) do |line|
      if first_line
        output << "This is the #{PHRASES[line].last}"
        first_line = false
      else
        output << "that #{PHRASES[line].first} the #{PHRASES[line].last}"
      end
    end

    output
  end
end
