# Bundler
require 'rubygems'
# require 'bundler/setup'

$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))

require 'rspec'
# require 'capistrano'
# require 'capistrano/configuration'

require 'capistrano-spec'

# Add capistrano-spec matchers and helpers to RSpec
RSpec.configure do |config|
  config.include Capistrano::Spec::Matchers
  config.include Capistrano::Spec::Helpers
end

require 'capistrano/monorepo/version'
require 'capistrano/monorepo/assets'
