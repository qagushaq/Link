# frozen_string_literal: true

# rubocop:disable Rails/Delegate
class Auth::SignOutAction
  include DI['services.sessions.delete']

  def call(session)
    delete.(session)
  end
end
# rubocop:enable Rails/Delegate
