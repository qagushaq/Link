# frozen_string_literal: true

RSpec.describe Sessions::Create do
  subject(:create_session) { described_class.new.(user: user) }

  let(:user) { create(:user) }

  it 'creates valid session' do
    expect { create_session }.to change(user.sessions, :count).by(1)
  end

  it 'creates valid session token' do
    expect(create_session.token).not_to be_nil
  end
end
