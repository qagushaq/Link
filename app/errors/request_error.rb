# frozen_string_literal: true

class RequestError < StandardError
  attr_reader :code, :title, :field

  HTTP_STATUS = 422 # Unprocessable entity

  # Creates the bad request error
  def initialize(title, code: nil, field: nil)
    super(title)

    @title = title
    @code = code || ErrorCodes::INVALID
    @field = field
  end

  # Status code for the error
  def status
    HTTP_STATUS
  end

  # Extended equality check to take error-specific fields in account
  def ==(other)
    super(other) &&
      code == other.code &&
      field == other.field
  end
end
