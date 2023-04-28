# frozen_string_literal: true

class InvalidInput < StandardError
  attr_reader :errors

  def initialize(message, result:)
    super(message)
    @errors = result.errors.to_h
  end
end
