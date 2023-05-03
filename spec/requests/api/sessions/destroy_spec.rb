# frozen_string_literal: true

RSpec.describe 'DELETE /api/session', type: :request do
  let(:path) { '/api/session' }

  context 'when logged in' do
    it 'deletes the session and clears the cookie' do
      delete path, headers: headers_for_user(create(:user))

      expect(response).to have_http_status :no_content
      expect(response.header['Set-Cookie']).to eq 'Authorization=; path=/; max-age=-1'
      expect(body).to eq({})
    end
  end

  context 'when not logged in' do
    it 'returns the authorization error' do
      delete path

      expect(response).to have_http_status :forbidden
    end
  end
end
