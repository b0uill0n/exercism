module BookKeeping
  VERSION = 2
end

class Acronym
  def self.abbreviate(text)
    text.scan(/\b([A-Za-z])|[a-z]([A-Z])/).join.upcase
  end
end
