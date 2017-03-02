class Scrabble
  POINTS = {
    1 => %w(a e i o u l n r s t),
    2 => %w(d g),
    3 => %w(b c m p),
    4 => %w(f h v w y),
    5 => %w(k),
    8 => %w(j x),
    10 => %w(q z)
  }.freeze

  def self.score(word)
    new(word).score
  end

  def initialize(word)
    @word = word.to_s.downcase
  end

  def score
    compute_score =
      @word.downcase.chars.each_with_object([]) do |c, a|
        POINTS.each_key { |k| a << k if POINTS[k].include?(c) }
      end

    compute_score.reduce(0, :+)
  end
end
