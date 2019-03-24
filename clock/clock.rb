class Clock
  ONE_DAY_HAS_MINUTE = 1440
  MIN_IN_HOUR = 60

  def initialize(hour: 0, minute: 0)
    @time = (hour * MIN_IN_HOUR + minute) % ONE_DAY_HAS_MINUTE
  end

  def +(clock)
    Clock.new(minute: time + clock.time)
  end

  def -(clock)
    Clock.new(minute: time - clock.time)
  end

  def ==(clock)
    time == clock.time
  end

  def to_s
    '%02d:%02d' % time.divmod(MIN_IN_HOUR)
  end

  protected

  attr_reader :time

end
