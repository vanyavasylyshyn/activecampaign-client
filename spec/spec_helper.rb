# frozen_string_literal: true

require 'webmock/rspec'
require 'pry'

rspec_custom = ::File.join(::File.dirname(__FILE__), 'support/**/*.rb')
::Dir[::File.expand_path(rspec_custom)].sort.each { |file| require file unless file[/\A.+_spec\.rb\z/] }

require_relative '../lib/tempo_ruby'

RSpec.configure do |config|
  config.expect_with(:rspec) do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
    expectations.syntax = :expect
  end

  config.mock_with(:rspec) do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.example_status_persistence_file_path = '.rspec_status'
  config.disable_monkey_patching!
  config.order = :random

  config.expose_dsl_globally = true

  ::Kernel.srand(config.seed)
end

def get_mock_response(file, value_if_file_not_found = false)
  file.sub!('?', '_') # we have to replace this character on Windows machine
  File.read(File.join(File.dirname(__FILE__), 'mock_responses/', file))
rescue Errno::ENOENT => e
  raise e if value_if_file_not_found == false
  value_if_file_not_found
end
