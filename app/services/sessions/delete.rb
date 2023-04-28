# frozen_string_literal: true

# Deletes the session of the user
class Sessions::Delete
  def call(session)
    session.destroy!
    session
  end
end
