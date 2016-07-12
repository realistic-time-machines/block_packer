class BlockPool
  attr_accessor :time_blocks

  def initialize(time_blocks: [])
    self.time_blocks = time_blocks
  end

  def to_a
    time_blocks.dup
  end

  def suckiness
    time_blocks.combination(2).map {|e| measure_distance(*e) }.reduce(&:+)
  end

  def measure_distance(a, b)
    a - b
  end
end
