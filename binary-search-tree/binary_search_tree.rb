class Bst

  attr_accessor :data, :left, :right

  def initialize(data)
    @data = data
  end

  def insert(data)
    if self.data < data
      self.right ? self.right.insert(data) : self.right = Bst.new(data)
    else
      self.left ? self.left.insert(data) : self.left = Bst.new(data)
    end
  end

  def each(&block)
    return enum_for(:each) unless block_given?

    left.each(&block) if left
    block.call(data)
    right.each(&block) if right
  end
end
