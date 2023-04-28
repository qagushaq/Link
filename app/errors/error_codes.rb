# frozen_string_literal: true

module ErrorCodes
  # General business rule validation error
  INVALID = 'INVALID'

  # Request input is invalid
  INVALID_INPUT = 'INVALID_INPUT'

  # Record not found
  NOT_FOUND = 'NOT_FOUND'

  # Record has incorrect state
  RECORD_INVALID = 'RECORD_INVALID'

  # Access policy violation
  UNAUTHORIZED = 'UNAUTHORIZED'
end
