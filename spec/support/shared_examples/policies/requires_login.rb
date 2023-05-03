# frozen_string_literal: true

# rubocop:disable RSpec/SharedContext
RSpec.shared_examples 'requires login' do
  failed 'when not logged in' do
    let(:user) { nil }
  end

  succeed 'when logged in' do
    let(:user) { build_stubbed(:user) }
  end
end
# rubocop:enable RSpec/SharedContext
