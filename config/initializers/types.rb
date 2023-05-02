# frozen_string_literal: true

# Definition of application-specific types that can be used in the input contracts.
module Types
  include Dry::Types()

  # Text string stripped off spaces
  StrippedString = Types::String.constructor(&:strip)

  # Email address with format validation
  Email = StrippedString.constrained(format: URI::MailTo::EMAIL_REGEXP)
end
