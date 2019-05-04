# frozen_string_literal: true

require "bundler/setup"
require "table_view"

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.fail_fast = 1 unless ENV["CI"] || ENV["NO_FAIL_FAST"] || ARGV.include?("-no-fail-fast")

  Dir[File.expand_path("../support/**/*.rb", __FILE__ )].each { |f| require f }
end

FIXTURES_PATH = File.expand_path("../fixtures", __FILE__)
