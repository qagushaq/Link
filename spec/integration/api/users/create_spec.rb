# frozen_string_literal: true

RSpec.describe 'Users', :with_sendgrid_request, type: :request do
  path '/api/users' do
    post 'Sign up' do
      tags 'Users'
      operationId 'signUp'

      consumes 'application/json'
      produces 'application/json'

      include_context 'with example response'

      parameter name: :params, in: :body, schema: {
        type: 'object',
        properties: {
          user: {
            type: 'object',
            properties: {
              email: { type: 'string', format: 'email' },
              password: { type: 'string' }
            },
            required: %w[email password]
          }
        },
        required: %w[user]
      }

      response '201', 'User signed up' do
        let(:params) { { user: { email: 'new@user.com', password: 'password', newsletter: true, timezone: 'UTC' } } }

        run_test!

        schema type: :object, properties: { data: { '$ref': '#/components/schemas/user' } }
      end
    end
  end
end
