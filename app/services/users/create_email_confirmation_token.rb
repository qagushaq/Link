# frozen_string_literal: true

class Users::CreateEmailConfirmationToken
  def call(user)
    user.update!(
      email_confirmation_token: free_confirmation_token,
      email_confirmed_at: nil
    )
  end

  private

  def free_confirmation_token
    loop do
      token = SecureRandom.uuid
      break token unless User.exists?(email_confirmation_token: token)
    end
  end
end
