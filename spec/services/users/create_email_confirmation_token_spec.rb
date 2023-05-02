# frozen_string_literal: true

RSpec.describe Users::CreateEmailConfirmationToken do
  subject(:init) { service.(user) }

  let(:service) { described_class.new }
  let(:user) { create(:user) }

  it 'sets token info' do
    init

    expect(user.email_confirmation_token).not_to be_nil
    expect(user.email_confirmed_at).to be_nil
  end
end
