# frozen_string_literal: true

lib = ::File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'activecampaign/client/version'

Gem::Specification.new do |spec|
  spec.name          = 'activecampaign-client'
  spec.version       = Activecampaign::Client::VERSION
  spec.authors       = ['Ivan Vasylyshyn']
  spec.email         = ['vanyavasylyshyn@gmail.com']

  spec.summary       = %(activecampaign_client)
  spec.description   = %(🚀 Ruby ActiveCampaign Client)
  spec.homepage      = 'https://github.com/vanyavasylyshyn/activecampaign-client'
  spec.license       = 'MIT'

  spec.metadata = {
    'homepage_uri' => 'https://github.com/vanyavasylyshyn/activecampaign-client',
    'changelog_uri' => 'https://github.com/vanyavasylyshyn/activecampaign-client/blob/main/CHANGELOG.md',
    'source_code_uri' => 'https://github.com/vanyavasylyshyn/activecampaign-client',
    'documentation_uri' => 'https://github.com/vanyavasylyshyn/activecampaign-client/blob/main/README.md',
    'bug_tracker_uri' => 'https://github.com/vanyavasylyshyn/activecampaign-client/issues'
  }

  spec.required_ruby_version = Gem::Requirement.new('>= 2.4.0')

  spec.files = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler-audit', '~> 0.9.0.1'
  spec.add_development_dependency 'fasterer', '~> 0.9.0'
  spec.add_development_dependency 'ffaker', '~> 2.20'
  spec.add_development_dependency 'overcommit', '~> 0.58.0'
  spec.add_development_dependency 'pry-byebug', '~> 3.9'
  spec.add_development_dependency 'rake', '~> 13.0', '>= 13.0.6'
  spec.add_development_dependency 'reek', '~> 6.0', '>= 6.0.6'
  spec.add_development_dependency 'rspec', '~> 3.10'
  spec.add_development_dependency 'rubocop', '~> 1.24'
  spec.add_development_dependency 'rubocop-performance', '~> 1.13'
  spec.add_development_dependency 'rubocop-rspec', '~> 2.7'
  spec.add_development_dependency 'simplecov', '~> 0.17.1'
end
