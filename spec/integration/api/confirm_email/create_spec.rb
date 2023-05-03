# frozen_string_literal: true

RSpec.describe 'Confirm email', type: :request do
  path '/api/confirm_email' do
    post 'Confirm email' do
      tags 'Confirm email'
      operationId 'confirmEmail'

      consumes 'application/json'
      produces 'application/json'

      parameter name: :root, in: :body, schema: {
        type: :object,
        properties: {
          token: { type: 'string' }
        },
        required: %w[token]
      }

      response '204', 'No Content' do
        let(:user) { create(:user, :with_unconfirmed_email) }
        let(:token) { user.email_confirmation_token }
        let(:root) { { token: token } }

        run_test!
      end

      response '404', 'Token not found' do
        let(:token) { 'unknown' }
        let(:root) { { token: token } }

        run_test!
      end

      response '422', 'Invalid token' do
        let(:token) { nil }
        let(:root) { { token: token } }

        run_test!
      end
    end
  end
end
