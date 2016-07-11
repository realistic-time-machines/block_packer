require 'spec_helper'
require 'block_packer/optimize_block_poolz'
require 'block_packer/block_pool'
require 'block_packer/time_block'
require 'pry'

RSpec.describe OptimizeBlockPoolz do
  def create_time_blocks(count, range:, origin:)
    lat_positive_offset = (origin[0] + range/2)
    lat_negative_offset = (origin[0] - range/2)

    lng_positive_offset = (origin[1] + range/2)
    lng_negative_offset = (origin[1] - range/2)

    (0...count).map do |i|
      TimeBlock.new(
        lat: Random.new.rand(lat_negative_offset...lat_positive_offset),
        lng: Random.new.rand(lng_negative_offset...lng_positive_offset)
      )
    end
  end

  describe '#just_do_it!' do
    it 'normalizes the size of each block pool'
    it 'maximizes the fitness for each block pool' do
      origin_a = [37.7641255,-122.4712481]
      origin_b = [40.662097,-73.9506997]
      range = 0.01
      length = 10
      location_a_time_blocks = create_time_blocks(length, range: 0.01, origin: origin_a)
      location_b_time_blocks = create_time_blocks(length, range: 0.01, origin: origin_b)

      combined = (location_a_time_blocks + location_b_time_blocks).shuffle
      blocks_for_pool_a = combined[0..(combined.length / 2)]
      blocks_for_pool_b = combined[(combined.length / 2)+1..-1]

      pool_a = BlockPool.new(time_blocks: blocks_for_pool_a)
      pool_b = BlockPool.new(time_blocks: blocks_for_pool_b)
      subject = OptimizeBlockPoolz.new(poolz: [pool_a, pool_b])
      subject.just_do_it!
      expect(subject.poolz)
        .to match_array([location_a_time_blocks, location_b_time_blocks])
    end
  end
end
