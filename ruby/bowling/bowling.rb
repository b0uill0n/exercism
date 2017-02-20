module BookKeeping
  VERSION = 3
end

class Game
  class BowlingError < StandardError; end

  def initialize
    @game = []
  end

  def roll(pins)
    verification(pins)

    @game << Frame.new if @game.size == 0 || current.status != 'open' && !last_frame?
    @game.select { |f| f.status != 'complete' }.each { |f| f.add(pins) }

  end

  def score
    raise BowlingError, 'Score cannot be calculated until end of the game' unless game_complete?
    @game.each.inject(0){ |sum, f| sum + f.score }
  end

  private

  def verification(pins)
    raise BowlingError, 'Pins must have a value from 0 to 10' unless pins.between?(0, 10)
    raise BowlingError, 'Too many pins in frame' if frame_error?(pins)
    raise BowlingError, 'No rolls allowed after game is over' if game_complete?
  end

  def last_frame?
    @game.size == 10
  end

  def frame_error?(pins)
    unless @game.empty?
      @game.select { |f| f.status == 'bonus' && f.strike? && !f.bonus.empty? }
        .any? { |f| f.bonus.first < 10 && f.score_bonus + pins > 10 } ||
      current.status == 'open' && current.score_frame + pins > 10
    end
  end

  def current
    @game.last
  end

  def game_complete?
    last_frame? && current.status == 'complete'
  end

end

class Game
  class Frame
    attr_reader :bonus, :frame

    def initialize
      @frame = []
      @bonus = []
    end

    def add(pins)
      status == 'open' ? @frame << pins : @bonus << pins
    end

    def score
      score_frame + @bonus.reduce(0, :+)
    end

    def status
      case
      when @frame.size.between?(0, 1) && score_frame < 10 then 'open'
      when strike? && @bonus.size < 2 then 'bonus'
      when spare? && @bonus.size < 1 then 'bonus'
      else
        'complete'
      end
    end

    def strike?
      @frame.first == 10
    end

    def spare?
      score_frame == 10 && @frame.size == 2
    end

    def score_frame
      @frame.reduce(0, :+)
    end

    def score_bonus
      @bonus.reduce(0, :+)
    end

    def to_s
      "#{@frame} - #{@bonus}"
    end
  end
end
