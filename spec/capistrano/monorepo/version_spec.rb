require 'spec_helper'

describe Capistrano::Monorepo do
  it 'has a version number' do
    expect(Capistrano::Monorepo::VERSION).not_to be nil
  end
end
