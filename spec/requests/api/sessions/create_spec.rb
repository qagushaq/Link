# frozen_string_literal: true

RSpec.describe 'POST /api/session', type: :request do
  let(:path) { '/api/session' }
  let(:invalid_credentials_error) do
    { title: I18n.t('errors.session.invalid_credentials'), status: 404, code: ErrorCodes::NOT_FOUND }
  end

  context 'with valid email and password' do
    let(:user) { create(:user) }
    let(:params) { { session: { email: user.email, password: user.password } } }

    it 'creates the session and returns it' do
      post path, params: params

      session = Session.last

      expect(response).to have_http_status :created

      expect(body[:data]).to eq(
        id: session.id.to_s,
        type: 'session',
        attributes: {
          token: session.token
        },
        relationships: {
          user: {
            data: {
              id: session.user.id,
              type: 'user'
            }
          }
        }
      )

      # Sets the cookie with the token
      expect(response.header['Set-Cookie']).to eq(
        "Authorization=Bearer+#{session.token}; path=/; HttpOnly; SameSite=Strict"
      )
    end
  end

  context 'with invalid email' do
    let(:params) { { session: { email: 'unknown@email.com', password: 'password' } } }

    it 'returns invalid credentials errors' do
      post path, params: params

      expect(response).to have_http_status :not_found
      expect(body).to have_error(I18n.t('errors.sessions.invalid_credentials'))
        .with_status(:not_found)
        .with_code(ErrorCodes::NOT_FOUND)
    end
  end

  context 'with invalid password' do
    let(:params) { { session: { email: create(:user).email, password: 'invalid' } } }

    it 'returns invalid credentials errors' do
      post path, params: params

      expect(response).to have_http_status :not_found
      expect(body).to have_error(I18n.t('errors.sessions.invalid_credentials'))
        .with_status(:not_found)
        .with_code(ErrorCodes::NOT_FOUND)
    end
  end
end
