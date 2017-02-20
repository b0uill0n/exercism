module BookKeeping
  VERSION = 1
end

module Accumulate
  def accumulate
    output = []
    self.each { |i| output << yield(i) }
    output.empty? ? self : output
  end
end

class Array
  include Accumulate
end
