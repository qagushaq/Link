# frozen_string_literal: true

RSpec.describe Sessions::CreateInput do
  it_behaves_like 'with required attributes', :session, %i[email password]
  it_behaves_like 'with constrained attribute', :session, :email, 'good@email.com', 'bad'
end
