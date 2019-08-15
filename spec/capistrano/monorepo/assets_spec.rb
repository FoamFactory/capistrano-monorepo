require 'spec_helper'

describe Capistrano::Monorepo::Assets, "loaded into a configuration" do
  before do
    @configuration = Capistrano::Configuration.new
    @configuration.extend(Capistrano::Spec::ConfigurationExtension)
    Capistrano::Monorepo::Assets.load_into(@configuration)
  end

  it "should define a task called monorepo:import_assets" do
    @configuration.find_task('monorepo:import_assets').should_not == nil
  end
end
