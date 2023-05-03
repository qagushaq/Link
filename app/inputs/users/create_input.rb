# frozen_string_literal: true

class Users::CreateInput < ApplicationContract
  json do
    required(:user).hash do
      required(:email).value(Types::Email)
      required(:password).value(Types::StrippedString, min_size?: User::MIN_PASSWORD_LENGTH)
    end
  end
end
