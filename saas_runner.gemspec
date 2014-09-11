# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'saas_runner/version'

Gem::Specification.new do |spec|
  spec.name          = "saas_runner"
  spec.version       = SaasRunner::VERSION
  spec.authors       = ["Paul Springett", "Peter Rhoades"]
  spec.email         = ["paul@simpleweb.co.uk", "pete@simpleweb.co.uk"]
  spec.description   = %q{Ruby client library for the Saas Runner REST API}
  spec.summary       = %q{Ruby client library for the Saas Runner REST API}
  spec.homepage      = "https://github.com/simpleweb/saasrunner-client-ruby"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "faraday", "~> 0.8"
  spec.add_dependency "faraday_middleware", "~> 0.9"
  spec.add_dependency "hashie", "~> 2.0.5"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "vcr"
end
