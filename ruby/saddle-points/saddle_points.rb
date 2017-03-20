class Matrix
  attr_reader :rows, :columns

  def initialize(matrix)
    @rows = matrix.split(/\n/).map { |row| row.split.map(&:to_i) }
    @columns = @rows.transpose
  end

  def saddle_points
    output = []

    @rows.each_with_index do |row, i|
      row.each_with_index do |value, j|
        output << [i, j] if value == row.max && value <= @columns[j].min
      end
    end

    output
  end
end
