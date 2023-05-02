# frozen_string_literal: true

RSpec.describe 'GET /api/user', type: :request do
  let(:path) { '/api/user' }

  context 'when logged in via cookie' do
    let(:session) { create(:session) }

    before { cookies[TokenAuth::COOKIE] = "Bearer #{session.token}" }

    it 'returns the user record' do
      get path, headers: {}
      expect(response).to have_http_status :success
    end
  end

  context 'when logged in via header' do
    let(:user) { create(:user) }

    it 'returns the user record' do
      get path, headers: headers_for_user(user)

      expect(response).to have_http_status :success

      expect(body).to eq(
        data: {
          id: user.id.to_s,
          type: 'user',
          attributes: {
            email: user.email,
            emailConfirmed: true
          }
        }
      )
    end
  end

  context 'when user is not logged in' do
    it 'returns errors' do
      get path

      expect(response).to have_http_status :forbidden
    end
  end
end
