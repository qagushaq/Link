# frozen_string_literal: true

RSpec.describe UserPolicy do
  let(:context) { { user: user } }
  let(:user) { {} }

  describe_rule :create? do
    succeed 'always'
  end

  describe_rule :confirm_email? do
    succeed 'always'
  end

  describe_rule :show? do
    include_examples 'requires login'
  end
end
