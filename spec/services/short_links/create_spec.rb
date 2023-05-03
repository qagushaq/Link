# frozen_string_literal: true

RSpec.describe ShortLinks::Create do
  subject(:create_short_link) { service.(url) }

  let(:service) { described_class.new }
  let(:url) { 'https://yandex.by' }

  it 'creates a new short link' do
    expect { create_short_link }.to change(ShortLink, :count).by(1)
  end

  it 'does not create a new short link if one with the same URL already exists' do
    create_short_link
    expect { create_short_link }.to change(ShortLink, :count).by(0)
  end
end
