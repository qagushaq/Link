# frozen_string_literal: true

RSpec.describe 'POST /api/confirm_email', type: :request do
  let(:path) { '/api/confirm_email' }

  context 'when user exists' do
    let(:user) { create(:user, :with_unconfirmed_email, email_confirmation_token: 'old') }
    let(:token) { user.email_confirmation_token }

    before { post path, headers: headers_for_user(user), params: { token: token }, as: :json }

    it 'returns success' do
      expect(response).to have_http_status :no_content
    end

    it 'initializes token info', :freeze_time do
      user.reload
      expect(user.email_confirmation_token).not_to eq 'old'
    end
  end

  context 'when token is missing' do
    let(:user) { create(:user) }

    it 'returns an error' do
      post path

      expect(response).to have_http_status(:unprocessable_entity)
      expect(body).to have_error(I18n.t('errors.confirm_email.token_missing'))
    end
  end
end
