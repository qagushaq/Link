# frozen_string_literal: true

RSpec.describe Users::CreateInput do
  subject { contract.(input) }

  let(:contract) { described_class.new }

  it_behaves_like 'with required attributes', :user, %i[email password]
  it_behaves_like 'with constrained attribute', :user, :email, 'good@email.com', 'bad'

  context 'when valid input' do
    let(:input) { { user: { email: 'foo@bar.com', password: '123456' } } }

    it { is_expected.to be_success }
  end

  describe 'password' do
    subject(:errors) { contract.(user: { password: password }).errors[:user][:password] }

    context 'when short' do
      let(:password) { 'a' * (User::MIN_PASSWORD_LENGTH - 1) }

      it { is_expected.to include "size cannot be less than #{User::MIN_PASSWORD_LENGTH}" }
    end

    context 'when long enough' do
      let(:password) { 'a' * User::MIN_PASSWORD_LENGTH }

      it { is_expected.to be_blank }
    end
  end
end
