# frozen_string_literal: true

RSpec.describe 'Short Links/show', type: :request do
  path '/api/short_links/{id}' do
    get 'Show Short Links' do
      tags 'Short lINKS'
      operationId 'showShortLinks'

      consumes 'application/json'
      produces 'application/json'

      include_context 'with example response'
      include_context 'when authenticated'

      parameter name: :id, in: :path, type: 'string'

      response '200', 'Shown' do
        let(:short_link) { create(:short_link) }
        let(:id) { short_link.slug }

        run_test!
      end

      response '404', 'Not found' do
        let(:id) { 'slug' }

        run_test!
      end
    end
  end
end
