# frozen_string_literal: true

RSpec.shared_examples_for 'with string attributes' do |parent, attrs = []|
  parent = Array(parent)

  attrs.each do |attr|
    it "validates #{parent.join('.')}.#{attr} is a string" do
      params = parent.reverse.inject(attr => 123) { |o, i| { i => o } }
      res = described_class.new.(params)

      errors = res.errors.to_h.dig(*parent)
      expect(errors[attr]).to eq ['must be a string']
    end
  end
end
