module BookKeeping
  VERSION = 2
end

class RunLengthEncoding
  def self.encode(data)
    result = []
    data.chars.chunk { |char| char }.each do |char, chunk|
      result << (chunk.length > 1 ? chunk.length.to_s + char : char)
    end

    result.join
  end

  def self.decode(data)
    result = []
    data.scan(/(\d+)?(.)/).each do |count, char|
      result << (count ? char * count.to_i : char)
    end

    result.join
  end
end
