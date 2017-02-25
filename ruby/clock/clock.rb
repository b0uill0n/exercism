module  BookKeeping
  VERSION = 2
end

class Clock
  def initialize(hours, mins)
    @hours = (hours % 24 + mins / 60) % 24
    @mins = mins % 60
  end

  def self.at(hours, mins)
    Clock.new(hours, mins)
  end

  def to_s
    "%02d:%02d" % [@hours, @mins]
  end

  def +(mins)
    Clock.new(@hours, @mins + mins)
  end

  def -(mins)
    Clock.new(@hours, @mins - mins)
  end

  def ==(clock2)
    to_s == clock2.to_s
  end
end
