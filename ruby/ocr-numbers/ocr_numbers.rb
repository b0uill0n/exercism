class OCR
  VALUES = {
      [' _ ', '| |', '|_|', '   '] => '0',
      ['   ', '  |', '  |', '   '] => '1',
      [' _ ', ' _|', '|_ ', '   '] => '2',
      [' _ ', ' _|', ' _|', '   '] => '3',
      ['   ', '|_|', '  |', '   '] => '4',
      [' _ ', '|_ ', ' _|', '   '] => '5',
      [' _ ', '|_ ', '|_|', '   '] => '6',
      [' _ ', '  |', '  |', '   '] => '7',
      [' _ ', '|_|', '|_|', '   '] => '8',
      [' _ ', '|_|', ' _|', '   '] => '9'
  }.freeze

  attr_reader :text

  def initialize(text)
    @text = text.split("\n")
  end

  def convert
    text.
      each_slice(4).map { |row| to_pattern(row) }.join(',')
  end

  def to_pattern(row)
    row.
      map { |row| row.chars.each_slice(3).to_a }.transpose.
      map { |pattern| value(pattern.map(&:join)) }.join
  end

  def value(pattern)
    VALUES[pattern] || '?'
  end
end
