require 'spec_helper'
require 'pry'
require 'block_packer/block_pool'
require 'block_packer/time_block'


RSpec.describe BlockPool do
  describe '#time_blocks' do
    it 'returns an array of TimeBlocks' do
      expected_collection = [TimeBlock.new, TimeBlock.new]
      subject = BlockPool.new(time_blocks: expected_collection)
      expect(subject.time_blocks.class).to eq(Array)
      expect(subject.time_blocks).to eq(expected_collection)
    end
  end

  describe '#twenty_four_hour_fitness' do
    it 'returns the aggregate fitness for the last 24 hours' do
      time_blocks = [TimeBlock.new, TimeBlock.new]

      expected_score =

      expect(subject.twenty_four_hour_fitness).to eq(expected_score)
    end
  end
end
