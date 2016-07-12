class OptimizeBlockPoolz
  attr_accessor :poolz

  def initialize(poolz:)
    self.poolz = poolz
  end

  def just_do_it!
    all_time_blocks = poolz.map(&:to_a).flatten
    number_of_blocks = all_time_blocks.length
    number_of_poolz = poolz.length
    all_combinations = all_time_blocks.combination(number_of_blocks)

    scores = all_combinations.map do |combination|
      slice_size = number_of_blocks / number_of_poolz
      new_block_pool = ->(s) { BlockPool.new time_blocks: s }
      test_poolz = combination.each_slice(slice_size).map &new_block_pool
      test_poolz.reduce(0) { |a, e| a + e.suckiness }
    end

    best_combinations = all_combinations.to_a[scores.index(scores.min)]
  end
end
