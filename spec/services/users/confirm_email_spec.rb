# frozen_string_literal: true

RSpec.describe Users::ConfirmEmail do
  let(:service) { described_class.new }

  let(:user) { create(:user, :with_unconfirmed_email) }

  it 'updates confirmation related fields', :freeze_time do
    service.(user)
    expect(user.email_confirmation_token).to eq nil
    expect(user.email_confirmed_at).to eq Time.current
  end
end
