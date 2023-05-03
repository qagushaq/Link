# frozen_string_literal: true

# Creates a session for the given user
class Sessions::Create
  def call(user:)
    user.sessions.create!
  end
end
