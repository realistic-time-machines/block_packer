$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'block_packer'
RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.syntax = :expect
  end

  config.mock_with :rspec do |mocks|
    mocks.syntax = :expect
    mocks.verify_partial_doubles = true
  end

  config.order = :random
  config.filter_run :focus
  config.run_all_when_everything_filtered = true
end
