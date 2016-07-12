require 'spec_helper'
require 'pry'
require 'block_packer/block_pool'
require 'block_packer/time_block'


RSpec.describe BlockPool do
  describe '#time_blocks' do
    it 'returns an array of TimeBlocks' do
      expected_collection =
        [TimeBlock.new(lat: 1, lng: 1), TimeBlock.new(lat: 1, lng: 1)]
      subject = BlockPool.new(time_blocks: expected_collection)

      expect(subject.time_blocks.class).to eq(Array)
      expect(subject.time_blocks).to eq(expected_collection)
    end
  end

  describe '#suckiness' do
    context 'when the block pool is really awesome' do
      it 'returns a low value' do
        time_blocks =
          [TimeBlock.new(lat: 1, lng: 1), TimeBlock.new(lat: 1, lng: 1)]

        subject = BlockPool.new(time_blocks: time_blocks)

        expected_score = 0

        expect(subject.suckiness).to eq(expected_score)
      end
    end

    context 'when the block pool just kinda sucks' do
      it 'returns a medium value' do
        time_blocks =
          [TimeBlock.new(lat: 0, lng: 0), TimeBlock.new(lat: 10, lng: 10)]

        subject = BlockPool.new(time_blocks: time_blocks)

        expected_score = 200

        expect(subject.suckiness).to eq(expected_score)
      end
    end

    context 'when the block pool sucks hard' do
      it 'returns a high value' do
        time_blocks =
          [TimeBlock.new(lat: -90, lng: 180), TimeBlock.new(lat: 90, lng: 180)]

        subject = BlockPool.new(time_blocks: time_blocks)

        expected_score = 32400

        expect(subject.suckiness).to eq(expected_score)
      end
    end

  end
end
