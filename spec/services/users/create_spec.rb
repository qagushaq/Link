# frozen_string_literal: true

RSpec.describe Users::Create do
  subject(:user) { described_class.new.(input) }

  context 'when creating with email' do
    let(:email) { 'some@email.com' }
    let(:password) { 'password' }
    let(:input) { { email: email, password: password } }

    it 'create valid user', :freeze_time do
      expect(user.email).to eq email
      expect(user.authenticate(password)).to eq user
    end
  end
end
