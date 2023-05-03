# frozen_string_literal: true

RSpec.describe UserPolicy do
  let(:context) { { user: user } }
  let(:user) { {} }

  describe_rule :create? do
    succeed 'always'
  end

  describe_rule :shortening_link? do
    failed 'when email is unconfirmed' do
      let(:user) { create(:user, :with_unconfirmed_email) }
    end

    failed 'when not logged in' do
      let(:user) { nil }
    end

    succeed 'when email is confirmed' do
      let(:user) { create(:user) }
    end
  end

  describe_rule :confirm_email? do
    succeed 'always'
  end

  describe_rule :show? do
    include_examples 'requires login'
  end
end
