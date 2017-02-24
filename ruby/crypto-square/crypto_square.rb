class Crypto
  attr_reader :normalize_plaintext, :size, :plaintext_segments,
    :ciphertext, :normalize_ciphertext

  def initialize(text)
    @normalize_plaintext = text.gsub(/[^\w]/, '').downcase
    @size = Math.sqrt(@normalize_plaintext.size).ceil
    @plaintext_segments = @normalize_plaintext.scan(/.{1,#{@size}}/)
    @ciphertext = rotation.join
    @normalize_ciphertext = rotation.join(' ')
  end

  private

  def rotation
    @size.times.with_object([]) do |letter, cipher|
      cipher << @plaintext_segments.map { |segment| segment[letter] }.join
    end
  end
end
