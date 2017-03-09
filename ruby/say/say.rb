module BookKeeping
  VERSION = 1
end

class Say
  NUMBERS = %w(zero one two three four five six seven eight nine ten
    eleven twelve thirteen fourteen fifteen sixteen seventeen
    eighteen nineteen)

  DECIMAL = [nil, nil] + %w(twenty thirty forty fifty sixty seventy eighty ninety)

  def initialize(number)
    @number = number
  end

  def in_english
    convert(@number)
  end

  private

  def convert(number)
    case number
    when 0..19
      NUMBERS[number]
    when 20..99
      build_phrase(number, 10, 'decimal')
    when 100..999 then
      build_phrase(number, 100, 'hundred')
    when 1_000..999_999
      build_phrase(number, 1_000, 'thousand')
    when 1_000_000..999_999_999
      build_phrase(number, 1_000_000, 'million')
    when 1_000_000_000..999_999_999_999
      build_phrase(number, 1_000_000_000, 'billion')
    else
      raise ArgumentError
    end
  end

  def build_phrase(number, devisor, suffix)
    remainder = number % devisor

    if suffix == 'decimal'
      output = DECIMAL[number / 10]
      output += "-#{convert(remainder)}" unless remainder.zero?
    else
      output = "#{convert(number / devisor)} #{suffix}"
      output += " #{convert(remainder)}" unless remainder.zero?
    end
    output
  end
end
