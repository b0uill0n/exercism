module BookKeeping
  VERSION = 2
end

class Raindrops
  SOUNDS = {
    3 => 'Pling',
    5 => 'Plang',
    7 => 'Plong'
  }.freeze

  def self.convert(number)
    sound = SOUNDS.each_key.each_with_object('') do |n, result|
      result << SOUNDS[n] if (number % n).zero?
    end
    sound.empty? ? number.to_s : sound
  end
end
