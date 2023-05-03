# frozen_string_literal: true

module HeadersHelper
  def headers_for_user(user)
    session = create(:session, user: user)
    {
      TokenAuth::TOKEN => "Bearer #{session.token}"
    }
  end
end
