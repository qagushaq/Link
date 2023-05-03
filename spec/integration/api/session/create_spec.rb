# frozen_string_literal: true

RSpec.describe 'Authentication', type: :request do
  path '/api/session' do
    post 'Sign in' do
      tags 'Authentication'
      operationId 'signIn'

      consumes 'application/json'
      produces 'application/json'

      include_context 'with example response'

      parameter name: :root, in: :body, schema: {
        type: 'object',
        properties: {
          session: {
            type: 'object',
            properties: {
              email: { type: 'string', format: 'email' },
              password: { type: 'string' }
            },
            required: %w[email password]
          },
          required: %w[session]
        }
      }

      let(:root) { { session: { email: email, password: password } } }

      response '201', 'User authenticated' do
        let(:user) { create(:user, :with_unconfirmed_email) }
        let(:email) { user.email }
        let(:password) { user.password }

        run_test!

        schema(
          type: :object,
          properties: {
            data: { '$ref': '#/components/schemas/session' },
            included: {
              type: 'array',
              items: { '$ref': '#/components/schemas/user' }
            }
          }
        )
      end

      response '404', 'Invalid credentials' do
        let(:email) { 'unknown@email.com' }
        let(:password) { 'unknown' }

        run_test!
      end
    end
  end
end
