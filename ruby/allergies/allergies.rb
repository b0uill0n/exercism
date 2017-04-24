class Allergies
  ALLERGENS = %w(eggs peanuts shellfish strawberries tomatoes chocolate pollen cats)

  attr_reader :score

  def initialize(score)
    @score = score
  end

  def allergic_to?(item)
    list.include?(item)
  end

  def list
    ALLERGENS.select.with_index{ |item, index| score & 2**index > 0 }
  end
end
