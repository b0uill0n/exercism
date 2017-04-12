class Cipher
  attr_reader :key, :key_bytes

  def initialize(key = nil)
    raise ArgumentError unless key.nil? || key =~ /\A[a-z]+\z/

    @key = key || ('a'..'z').to_a.sample(100).join
    @key_bytes = to_bytes(@key)
  end

  def encode(plaintext)
    ciphertext = []

    to_bytes(plaintext).each_with_index do |byte, index|
      ciphertext << (byte + key_bytes[index % key_bytes.size]) % 26
    end

    to_string(ciphertext)
  end

  def decode(ciphertext)
    plaintext = []

    to_bytes(ciphertext).each_with_index do |byte, index|
      plaintext << (byte - key_bytes[index % key_bytes.size]) % 26
    end

    to_string(plaintext)
  end

  def to_bytes(string)
    string.unpack('c*').map { |c| c - 97 }
  end

  def to_string(bytes)
    bytes.map { |c| c + 97 }.pack('c*')
  end
end
