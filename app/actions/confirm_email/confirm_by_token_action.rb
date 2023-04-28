# frozen_string_literal: true

class ConfirmEmail::ConfirmByTokenAction
  include DI[
    confirm_email: 'services.users.confirm_email'
  ]

  def call(token)
    user = User.find_by!(email_confirmation_token: token)
    confirm_email.(user)

    user
  rescue ActiveRecord::RecordNotFound
    raise ActiveRecord::RecordNotFound, 'Invalid token'
  end
end
