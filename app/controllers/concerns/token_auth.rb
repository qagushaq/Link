# frozen_string_literal: true

module TokenAuth
  COOKIE = 'Authorization'
  TOKEN = 'Authorization'

  private

  def current_user
    current_session&.user
  end

  def current_session
    return @current_session if defined?(@current_session)

    token = parse_header(auth_header)
    @current_session = Sessions::FindAndTouch.new.(token: token)
  end

  def auth_header
    request.cookies[COOKIE] || request.headers[TOKEN]
  end

  def parse_header(header)
    return nil unless header =~ /^Bearer (.+)$/

    Regexp.last_match(1).strip
  end

  # Stores session in the headers
  def store_auth_headers(session)
    value = "Bearer #{session.token}"

    # Persist in a cookie for web clients:
    # - path to root so they could see it themselves on the node.js server
    # - httponly not to let them read it from JS
    # - samesite to ensure it's our cookie
    response.set_cookie(COOKIE, value: value, path: '/', httponly: true, same_site: 'Strict')

    # Store in a header for mobile apps
    headers[TOKEN] = value
  end

  # Reset cookie immediately
  def reset_auth_headers
    response.set_cookie(COOKIE, value: '', path: '/', max_age: -1)
  end
end
