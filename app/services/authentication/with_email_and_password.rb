# frozen_string_literal: true

# Authenticates the user with email and password.
# If the user is found and password matches, the user is returned.
# Otherwise the `ActiveRecord::RecordNotFound` error with proper error message is raised.
class Authentication::WithEmailAndPassword
  def call(email:, password:)
    user = authenticate(email, password)

    raise ActiveRecord::RecordNotFound, I18n.t('errors.sessions.invalid_credentials') unless user

    user
  end

  def authenticate(email, password)
    # NOTE: Users table has email indexeed with LOWER(email)
    user = User.find_by('LOWER(email) = ?', email.downcase)

    # Auth fails if no user or no password
    return if user&.password_digest.blank?

    user.authenticate(password)
  end
end
