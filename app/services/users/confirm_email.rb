# frozen_string_literal: true

class Users::ConfirmEmail
  def call(user)
    user.update!(
      email_confirmation_token: nil,
      email_confirmed_at: Time.current
    )
  end
end
