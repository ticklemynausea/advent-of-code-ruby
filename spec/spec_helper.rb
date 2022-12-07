# frozen_string_literal: true

require "advent_of_code"

require "tempfile"

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.before(:each) do
    next unless described_class.to_s.match?(/^AdventOfCode::Year\d{4}::Day\d{2}/)

    if respond_to?(:input)
      $stdin = Tempfile.new
      $stdin.write(input)
      $stdin.rewind

      next
    end

    $stdin = AdventOfCode.input_file_for(described_class)
  end

  config.after(:each) do; end
end
