class RailFenceCipher
  VERSION = 1

  def self.encode(text, rails)
    new(text, rails).encode
  end

  def self.decode(text, rails)
    new(text, rails).decode
  end

  def initialize(text, rails)
    @text = text
    @rails = rails
    @fence = build_fence
    @cycle = build_cycle
  end

  def encode
    @text.chars.each_with_index { |c, i| @fence[@cycle[i % @cycle.size]] << c }
    @fence.flatten.join
  end

  def decode
    (0..@text.size - 1).each { |i| @fence[@cycle[i % @cycle.size]] << i }

    pattern = @fence.flatten

    (0..@text.size - 1).each_with_object([]) do |i, a|
      a << @text[pattern.find_index(i)]
    end.join
  end

  private

  def build_fence
    Array.new(@rails) { [] }
  end

  def build_cycle
    (0..@rails - 1).to_a + (1..@rails - 2).to_a.reverse
  end
end
