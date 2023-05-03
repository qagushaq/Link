# frozen_string_literal: true

RSpec.describe 'GET /api/short_link', type: :request do
  let(:path) { '/api/short_link' }

  context 'when logged in via header' do
    let(:user) { create(:user) }
    let(:short_link) { create(:short_link) }

    it 'returns the short link record' do
      get path, headers: headers_for_user(user), params: { short_link: { url: short_link.url } }, as: :json

      expect(response).to have_http_status :success
      expect(body).to eq(
        data: {
          id: short_link.id.to_s,
          type: 'shortLink',
          attributes: {
            url: short_link.url,
            slug: short_link.slug
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
