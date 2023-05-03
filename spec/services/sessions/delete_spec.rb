# frozen_string_literal: true

RSpec.describe Sessions::Delete do
  let(:service) { described_class.new }

  it 'deletes the session' do
    session = create(:session)

    service.(session)

    expect(session).to be_destroyed
  end
end
