require 'byebug'

class Array
  def accumulate
    map { |el| yield el }
  end
end
