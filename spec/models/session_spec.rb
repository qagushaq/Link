# frozen_string_literal: true

RSpec.describe Session, type: :model do
  it { is_expected.to belong_to(:user) }
end
