class SecretHandshake
  ACTIONS = ['wink', 'double blink', 'close your eyes', 'jump'].freeze

  attr_reader :digits

  def initialize(decimal)
    @digits =
      (decimal.is_a? Integer) ? decimal.to_s(2).reverse.chars.map(&:to_i) : 0
  end

  def commands
    handshake = []

    ACTIONS.each_with_index do |action, index|
      handshake << action if digits[index] == 1
    end

    digits[4] == 1 ? handshake.reverse : handshake
  end
end
