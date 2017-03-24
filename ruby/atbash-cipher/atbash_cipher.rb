class Atbash
  def self.encode(plaintext)
    new(plaintext).encode
  end

  attr_reader :plaintext

  def initialize(plaintext)
    @plaintext = plaintext
  end

  def encode
    alphabet = 'abcdefghijklmnopqrstuvwxyz'

    plaintext.downcase.
      gsub(/[^a-z0-9]/, '').
      tr(alphabet, alphabet.reverse).
      scan(/.{1,5}/).join(' ')
  end
end
