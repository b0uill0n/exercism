class Bob
  def self.hey(phrase)
    return "Whoa, chill out!" if phrase =~ /^[^a-z]+$/ && phrase =~ /[A-Z]/
    return "Sure." if phrase.end_with?("?") && !(phrase =~ /([A-Z]+\s)+/)
    return "Fine. Be that way!" if phrase.empty? || phrase =~ /^[\s\t]+$/
    'Whatever.'
  end
end
