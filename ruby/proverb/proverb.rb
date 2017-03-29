class Proverb
  attr_reader :chain, :qualifier

  def initialize(*chain, qualifier: '')
    @chain = chain
    @qualifier = qualifier
  end

  def to_s
    output = ''

    chain.each_cons(2) do |item1, item2|
      output << "For want of a %s the %s was lost.\n" % [item1, item2]
    end

    output << 'And all for the want of a %s' % [qualifier]
    output.rstrip << ' %s.' % [chain.first]
  end
end
