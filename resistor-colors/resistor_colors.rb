class ResistorColors
  COLORS = {
      "black" => 0,
      "brown" => 1,
      "red" => 2,
      "orange" => 3,
      "yellow" => 4,
      "green" => 5,
      "blue" => 6,
      "violet" => 7,
      "grey" => 8,
      "white" => 9}

  def self.value(resistor_colors)
    resistor_colors.map { |c| COLORS[c]}.join.to_i
  end
end
