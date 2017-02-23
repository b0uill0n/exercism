module BookKeeping
  VERSION = 1
end

class Bst
  include BookKeeping

  attr_reader :data, :left, :right

  def initialize(number)
    @data = number
  end

  def insert(number)
    number <= @data ? left_insert(number) : right_insert(number)
  end

  def each(&block)
    return enum_for(:each) unless block_given?

    @left.each(&block) if @left
    yield @data
    @right.each(&block) if @right
  end

  private

  def left_insert(number)
    @left ? @left.insert(number) : @left = Bst.new(number)
  end

  def right_insert(number)
    @right ? @right.insert(number) : @right = Bst.new(number)
  end
end
