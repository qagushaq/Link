# frozen_string_literal: true

RSpec.describe User do
  describe 'associations' do
    it { is_expected.to have_many(:sessions).dependent(:destroy) }
  end

  describe 'common validations' do
    it { is_expected.to validate_presence_of(:password) }
    it { is_expected.not_to validate_presence_of(:email) }
  end

  describe '.email_confirmed?' do
    it { expect(build(:user, email_confirmed_at: nil)).not_to be_email_confirmed }
    it { expect(build(:user, email_confirmed_at: Time.current)).to be_email_confirmed }
  end
end
