module BookKeeping
  VERSION = 2
end

class Queens
  def initialize(queens)
    @queens = queens

    @queens.each_value do |square|
      raise ArgumentError if square.any? { |c| !c.between?(0, 7) }
    end
  end

  def attack?
    @queens[:white][0] == @queens[:black][0] ||
      @queens[:white][1] == @queens[:black][1] ||
      (@queens[:white][0] - @queens[:black][0]).abs ==
      (@queens[:white][1] - @queens[:black][1]).abs
  end
end
