# frozen_string_literal: true

class Auth::SignInAction
  include DI[
    authenticate: 'services.authentication.with_email_and_password',
    create_session: 'services.sessions.create',
  ]
  def call(email:, password:)
    user = authenticate.(email: email, password: password)
    create_session.(user: user)
  end
end
