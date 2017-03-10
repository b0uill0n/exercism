require "date"

class Meetup
  def initialize(month, year)
    @month = month
    @year = year
  end

  def day(weekday, schedule)
    range = (Date.new(@year, @month, 1)..Date.new(@year, @month, -1))
    candidates = range.select { |date| date.send("#{weekday}?") }

    case schedule
    when :first
      candidates.first
    when :second
      candidates[1]
    when :third
      candidates[2]
    when :fourth
      candidates[3]
    when :last
      candidates.last
    when :teenth
      candidates.find { |date| date.day.between?(13, 19) }
    end
  end
end
