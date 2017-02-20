module BookKeeping
  VERSION = 3
end

class Binary
  def self.to_decimal(binary)
    raise ArgumentError if binary =~ /[^01]/
    binary.each_char.inject(0) {|sum, char| sum * 2 + char.to_i }
  end
end
