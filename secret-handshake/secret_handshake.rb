class SecretHandshake

  SECRET_HANDSHAKE = { 1000 => 'jump', 100 => 'close your eyes', 10 => 'double blink', 1 =>'wink'}.freeze

  def initialize(number)
    @number = number.is_a?(Integer) ? number.to_s(2).to_i : []
    @result = []
  end

  def commands
    return @number if @number == []

    @number > 10_000 ? more_10_000 : less_10_000
  end

  def more_10_000
    dif = @number - 10_000
    SECRET_HANDSHAKE.each do |k,v|
      if dif - k >= 0
        dif -= k
        @result << v
      end
    end
    @result
  end

  def less_10_000
    SECRET_HANDSHAKE.each do |k,v|
      if @number - k >= 0
        @number -= k
        @result << v
      end
    end
    @result.reverse
  end
end