# frozen_string_literal: true

lib = ::File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'tempo/version'

Gem::Specification.new do |spec|
  spec.name          = 'tempo-ruby'
  spec.version       = Tempo::VERSION
  spec.authors       = ['Ivan Vasylyshyn']
  spec.email         = ['vanyavasylyshyn@gmail.com']

  spec.summary       = %(tempo-ruby)
  spec.description   = %(🚀 Ruby Tempo Client)
  spec.homepage      = 'https://github.com/vanyavasylyshyn/tempo-ruby'
  spec.license       = 'MIT'

  spec.metadata = {
    'homepage_uri' => 'https://github.com/vanyavasylyshyn/tempo-ruby',
    'changelog_uri' => 'https://github.com/vanyavasylyshyn/tempo-ruby/blob/main/CHANGELOG.md',
    'source_code_uri' => 'https://github.com/vanyavasylyshyn/tempo-ruby',
    'documentation_uri' => 'https://github.com/vanyavasylyshyn/tempo-ruby/blob/main/README.md',
    'bug_tracker_uri' => 'https://github.com/vanyavasylyshyn/tempo-ruby/issues'
  }

  spec.required_ruby_version = Gem::Requirement.new('>= 2.7.0')

  spec.files = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'activesupport', '~> 6.1.4.1'

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
  spec.add_development_dependency 'rubocop-rake', '~> 0.6.0'
  spec.add_development_dependency 'rubocop-rspec', '~> 2.7'
  spec.add_development_dependency 'simplecov', '~> 0.17.1'
  spec.add_development_dependency 'webmock', '~> 3.12.2'
end
