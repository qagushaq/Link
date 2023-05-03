# frozen_string_literal: true

RSpec.describe Authentication::WithEmailAndPassword do
  let(:authenticate) { described_class.new }

  it 'return user for valid credentials' do
    user = create(:user, password: 'valid_password')
    expect(authenticate.(email: user.email, password: 'valid_password')).to eq user
  end

  it 'returns user for credentials with wrong email case' do
    user = create(:user, email: 'some@email.com', password: 'valid_password')
    expect(authenticate.(email: user.email.upcase, password: 'valid_password')).to eq user
  end

  it 'returns user with unconfirmed email' do
    user = create(:user, :with_unconfirmed_email, email: 'some@email.com', password: 'valid_password')
    expect(authenticate.(email: user.email, password: 'valid_password')).to eq user
  end

  it 'raises RecordNotFound for unknown email' do
    expect { authenticate.(email: 'unknown@email.com', password: '') }.to raise_error ActiveRecord::RecordNotFound
  end

  it 'raises RecordNotFound when user has no password' do
    user = create(:user)
    expect { authenticate.(email: user.email, password: 'invalid') }.to raise_error ActiveRecord::RecordNotFound
  end

  it 'raises RecordNotFound for invalid password' do
    user = create(:user, password: 'otherpassword')
    expect { authenticate.(email: user.email, password: 'invalid') }.to raise_error ActiveRecord::RecordNotFound
  end
end
