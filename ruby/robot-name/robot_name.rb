class Robot
  @@use_name = nil

  attr_reader :name

  def initialize
    generate_robot_name
    @@use_name = @name
  end

  def reset
    generate_robot_name
  end

  private

  def generate_robot_name
    loop do
      @name = [('A'..'Z').to_a.sample(2), format(rand(0..1000).to_s, '%03d')].join
      return @name until @name.eql?(@@use_name)
    end
  end
end

class BookKeeping
  VERSION = 2
end
