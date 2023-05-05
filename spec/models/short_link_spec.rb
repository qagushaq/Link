# frozen_string_literal: true

RSpec.describe ShortLink, type: :model do
  it { is_expected.to validate_presence_of(:url) }
  it { is_expected.to validate_presence_of(:slug) }
end
