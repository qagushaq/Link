# frozen_string_literal: true

RSpec.describe 'Short links / create', type: :request do
  path '/api/short_links' do
    post 'Create short link' do
      tags 'Short links / create'
      operationId 'createShortLink'

      consumes 'application/json'

      include_context 'when authenticated'

      parameter name: :params, in: :body, schema: {
        type: 'object',
        properties: {
          shortLink: {
            type: 'object',
            properties: {
              url: { type: 'string' }
            },
            required: %w[url]
          }
        },
        required: %w[shortLink]
      }

      response '201', 'Short link created' do
        let(:params) { { short_link: { url: 'https://yandex.by' } } }

        run_test!
      end
    end
  end
end
