# frozen_string_literal: true

# rubocop:disable RSpec/SharedContext
RSpec.shared_examples 'requires guest' do
  succeed 'when not logged in' do
    let(:user) { nil }
  end

  failed 'when logged in' do
    let(:user) { build_stubbed(:user) }
  end
end
# rubocop:enable RSpec/SharedContext
