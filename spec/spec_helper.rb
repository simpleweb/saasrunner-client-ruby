require 'vcr'

VCR.configure do |c|
  c.cassette_library_dir = 'spec/cassettes'
  c.hook_into :faraday
  c.default_cassette_options = { record: :new_episodes }
  c.configure_rspec_metadata!
end

require 'saas_runner'

RSpec.configure do |config|
  config.treat_symbols_as_metadata_keys_with_true_values = true
end
