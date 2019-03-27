class Year

  def self.leap?(year)
    return false if year % 4 != 0
    return true if year % 4 == 0 && year %100 != 0
    return false if year % 100 == 0 && year % 400 != 0
    return true if year % 400 == 0
    return false if year % 200 == 0 && year % 400 != 0
  end
end
