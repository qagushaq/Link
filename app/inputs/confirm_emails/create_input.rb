# frozen_string_literal: true

class ConfirmEmails::CreateInput < ApplicationContract
  json do
    required(:token).value(Types::StrippedString)
  end
end
