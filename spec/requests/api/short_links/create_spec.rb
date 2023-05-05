# frozen_string_literal: true

RSpec.describe 'POST /api/short_links', type: :request do
  let(:path) { '/api/short_links' }

  context 'when user confirmed' do
    let(:user) { create(:user) }
    let(:url) { 'https://yandex.by' }

    it 'returns created' do
      post path, headers: headers_for_user(user), params: { short_link: { url: url } }, as: :json
      expect(response).to have_http_status :created
    end
  end

  context 'when user unconfirmed' do
    let(:user) { create(:user, :with_unconfirmed_email) }
    let(:url) { 'https://yandex.by' }

    it 'returns an error' do
      post path, headers: headers_for_user(user), params: { short_link: { url: url } }, as: :json
      expect(response).to have_http_status(:forbidden)
    end
  end

  context 'when url in missing' do
    let(:user) { create(:user) }
    let(:url) { 'failed_url' }

    it 'returns an error' do
      post path, headers: headers_for_user(user), params: { short_link: { url: url } }, as: :json
      expect(response).to have_http_status(:unprocessable_entity)
      expect(body).to have_error(I18n.t('errors.short_links.url_missing'))
    end
  end
end
