# frozen_string_literal: true

RSpec.describe 'Authentication', type: :request do
  path '/api/session' do
    delete 'Sign out' do
      tags 'Authentication'
      operationId 'signOut'

      include_context 'when authenticated'

      response '204', 'User signed out' do
        run_test!
      end
    end
  end
end
