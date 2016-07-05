class BlockPool
  attr_accessor :time_blocks

  def initialize(time_blocks: [])
    self.time_blocks = time_blocks
  end
end
