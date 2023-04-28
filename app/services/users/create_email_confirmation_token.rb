# frozen_string_literal: true

class Users::CreateEmailConfirmationToken
  def call(user)
    user.update!(
      email_confirmation_token: SecureRandom.uuid,
      email_confirmed_at: nil
    )
  end
end
