# frozen_string_literal: true

RSpec.describe 'GET /api/short_links/:id', type: :request do
  let(:path) { "/api/short_links/#{slug}" }

  context 'when logged in via header' do
    let(:user) { create(:user) }
    let(:short_link) { create(:short_link) }
    let(:slug) { short_link.slug }

    it 'returns the short link record' do
      get path, headers: headers_for_user(user)

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
    let(:short_link) { create(:short_link) }
    let(:slug) { short_link.slug }

    it 'returns errors' do
      get path

      expect(response).to have_http_status :forbidden
    end
  end

  context 'when short link not found' do
    let(:user) { create(:user) }
    let(:slug) { 'slug' }

    it 'returns errors' do
      get path, headers: headers_for_user(user)

      expect(body).to eq(
        {
          errors: [
            {
              title: 'Short Link not found',
              status: 404,
              code: 'NOT_FOUND'
            }
          ]
        }
      )

      expect(response).to have_http_status :not_found
    end
  end
end
