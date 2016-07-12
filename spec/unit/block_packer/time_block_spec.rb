require 'spec_helper'
require 'block_packer/time_block'

RSpec.describe TimeBlock do
  describe '#-' do
    it 'calculates euclidean distance' do
      subject = TimeBlock.new(lat: 0, lng: 0)
      other = TimeBlock.new(lat: 10, lng: 10)

      expect(subject - other).to eq((0 - 10)**2 + (0 - 10)**2)
    end
  end
end
