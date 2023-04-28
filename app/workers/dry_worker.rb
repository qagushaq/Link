# frozen_string_literal: true

module DryWorker
  extend ActiveSupport::Concern

  included do
    include Sidekiq::Worker
  end

  def call(*args)
    worker = self.class
    worker.perform_async(*args)
  end
end
