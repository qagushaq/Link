# frozen_string_literal: true

class Sessions::CreateInput < ApplicationContract
  json do
    required(:session).hash do
      required(:email).value(Types::Email)
      required(:password).value(:string)
    end
  end
end
