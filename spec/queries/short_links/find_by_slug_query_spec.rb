# frozen_string_literal: true

RSpec.describe ShortLinks::FindBySlugQuery do
  subject(:find_short_link) { query.(slug) }

  let(:query) { described_class.new }

  context 'when short link found' do
    let(:short_link) { create(:short_link) }
    let(:slug) { short_link.slug }

    it 'show a short link' do
      expect(find_short_link).to eq short_link
    end
  end

  context 'when short link no found' do
    let(:slug) { 'unknown' }

    it { expect { find_short_link }.to raise_error ActiveRecord::RecordNotFound }
  end
end
