# frozen_string_literal: true

RSpec.describe SessionPolicy do
  let(:context) { { user: user } }
  let(:user) { nil }

  describe_rule :create? do
    include_examples 'requires guest'
  end

  describe_rule :destroy? do
    include_examples 'requires login'
  end
end
