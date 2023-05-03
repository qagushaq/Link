# frozen_string_literal: true

RSpec.shared_context 'when authenticated' do
  security [bearer: []]

  let(:user) { create(:user) }
  let(:session) { create(:session, user: user) }
  let(:Authorization) { "Bearer #{session.token}" }
end
