require 'capistrano'

module Capistrano
  module Monorepo
    module Assets
      def self.load_into(configuration)
        configuration.load do
          load File.expand_path('../../tasks/assets.rake', __FILE__)
        end
      end
    end
  end
end

# may as well load it if we have it
# if Capistrano::Configuration.instance
#   Capistrano::Monorepo::Assets.load_into(Capistrano::Configuration.instance)
# end
