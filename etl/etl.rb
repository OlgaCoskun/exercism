class ETL
  def self.transform(old)
    result = {}
    old.each do |number, letters|
      letters.each do |letter|
        result[letter.downcase] = number
      end
    end
    result
  end
end
