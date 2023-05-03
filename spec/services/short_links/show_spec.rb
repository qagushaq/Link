# frozen_string_literal: true

RSpec.describe ShortLinks::Show do
  subject(:show_short_link) { service.(short_link.url) }

  let(:service) { described_class.new }
  let(:short_link) { create(:short_link) }

  it 'show a short link' do
    expect(show_short_link.url).to eq(short_link.url)
    expect(show_short_link.slug).to eq(short_link.slug)
  end
end
