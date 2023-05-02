# frozen_string_literal: true

RSpec.shared_examples_for 'with required attributes' do |parent, attrs|
  parent = Array(parent)

  attrs.each do |attr|
    it "validates #{parent.join('.')}.#{attr} is required" do
      params = parent.reverse.inject({}) { |o, i| { i => o } }
      res = described_class.new.(params)

      errors = res.errors.to_h.dig(*parent)
      expect(errors[attr] || []).to include 'is missing'
    end
  end
end
