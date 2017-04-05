module BookKeeping
  VERSION = 1
end

class Element
  attr_reader :datum
  attr_accessor :next

  def initialize(datum, next_element = nil)
    @datum = datum
    @next = next_element
  end
end

class SimpleLinkedList
  attr_reader :first, :last, :size

  def initialize(elements = [])
    @first = nil
    @last = nil
    @size = 0

    elements.each { |datum| push(Element.new(datum)) }
  end

  def push(element)
    if first.nil?
      @first = element
      @last = element
    else
      last.next = element
      @last = element
    end

    @size += 1
    return self
  end

  def pop
    if last.nil?
      return
    else
      deleted_element = last

      if size > 1
        each.with_index do |element, index|
          @last = element if index == (size - 2)
        end
        last.next = nil
      end

      @size -= 1
      return deleted_element
    end
  end

  def to_a
    each.map(&:datum).reverse
  end

  def reverse!
    elements = each.with_object([]) { |element, acc| acc << element }.reverse

    @first = nil
    @size = 0

    elements.each do |element|
      element.next = nil
      self.push(element)
    end

    self
  end

  private

  def each
    return enum_for(:each) unless block_given?
    current = first

    loop do
      break if current.nil?
      yield current
      current = current.next
    end
  end
end
