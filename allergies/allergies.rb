class Allergies
  ALLERGENS = {
      1 => 'eggs',
      2 => 'peanuts',
      4 => 'shellfish',
      8 => 'strawberries',
      16 => 'tomatoes',
      32 => 'chocolate',
      64 => 'pollen',
      128 => 'cats'
  }.freeze

  attr_reader :list

  def initialize(number)
    @list = ALLERGENS.select { |key, _| key & number == key }.values
  end

  def allergic_to?(allergen)
    list.include?(allergen)
  end
end
