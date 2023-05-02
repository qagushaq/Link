# frozen_string_literal: true

RSpec.describe 'User', type: :request do
  path '/api/user' do
    get 'Show' do
      tags 'User'
      operationId 'showUser'

      consumes 'application/json'
      produces 'application/json'

      include_context 'with example response'
      include_context 'when authenticated'

      response '200', 'Shown' do
        run_test!

        schema type: :object, properties: { data: { '$ref': '#/components/schemas/user' } }
      end
    end
  end
end
