module FlattenArray
  VERSION = 1

  def self.flatten(array)
    output = []

    array.each do |i|
      next if i.nil?
      output += (i.kind_of?(Array) ? self.flatten(i) : [i])
    end

    output
  end
end

