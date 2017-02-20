module Strain
  def keep
    output = []
    self.each { |i| output << i if yield(i) }
    output
  end

  def discard
    output = []
    self.each { |i| output << i unless yield(i) }
    output
  end
end

class Array
  include Strain
end
