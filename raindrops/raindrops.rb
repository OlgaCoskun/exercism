class Raindrops
  RULES = {
      3 => 'Pling',
      5 => 'Plang',
      7 => 'Plong'
  }

  def self.convert(number)
    music = ''
    RULES.each_with_object([]) { |(sound, raindrop)| music << raindrop if number % sound == 0 }
    music.empty? ? number.to_s : music
  end
end