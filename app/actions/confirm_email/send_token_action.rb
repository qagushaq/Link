# frozen_string_literal: true

class ConfirmEmail::SendTokenAction
  include DI[
    'workers.users.send_email_confirmation_request'
  ]

  def call(user)
    send_email_confirmation_request.(user.id)
  end
end
