class PhoneNumber
  def self.clean(number)
    numbers = number.scan(/\d/).join.sub(/\A1/,'')
    return nil unless numbers =~ /\A([2-9]\d\d){2}(\d){4}\z/
    numbers
  end
end
