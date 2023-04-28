# frozen_string_literal: true

require 'rspec/core/rake_task'

namespace :docs do
  desc 'Generate API docs'
  RSpec::Core::RakeTask.new('generate') do |t|
    # Force test environment for this task
    ENV['RAILS_ENV'] = 'test'

    t.pattern = 'spec/integration/**/*_spec.rb'
    t.rspec_opts = ['--format Rswag::Specs::SwaggerFormatter', '--order defined']
  end
end

task docs: ['docs:generate']
