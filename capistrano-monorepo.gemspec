# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'capistrano/monorepo/version'

Gem::Specification.new do |gem|
  gem.name          = 'capistrano-monorepo'
  gem.authors       = ['Scott Johnson']
  gem.email         = ['jaywir3@gmail.com']
  gem.version       = Capistrano::Monorepo::VERSION

  gem.summary       = 'Capistrano plugin for working with monorepos'
  gem.homepage      = 'https://github.com/foamfactory/capistrano-monorepo'
  gem.license       = 'MPL-2.0'

  # gem.files         = `git ls-files`.split($/)
  gem.files         = Dir['lib/**/*.rb', 'lib/**/*.rake']
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  # gem.files         = `git ls-files`.split("$/")
  # gem.bindir        = 'bin'
  # gem.executables   = gem.files.grep(%r{^exe/}) { |f| File.basename(f) }
  # gem.require_paths = ['lib']

  gem.add_dependency 'capistrano', '~> 3.0'

  gem.add_development_dependency 'bundler',    '~> 2.0.2'
  gem.add_development_dependency 'rake',       '~> 12.3.3'
  gem.add_development_dependency 'rspec',      '~> 3.8'
  gem.add_development_dependency 'capistrano-spec'
end
