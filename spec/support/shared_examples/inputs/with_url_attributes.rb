# frozen_string_literal: true

RSpec.shared_examples_for 'with url attributes' do |parent, attrs = []|
  parent = Array(parent)

  attrs.each do |attr|
    it "validates #{parent.join('.')}.#{attr} is a URL" do
      params = parent.reverse.inject(attr => 'invalid-url') { |o, i| { i => o } }
      res = described_class.new.(params)

      errors = res.errors.to_h.dig(*parent)
      expect(errors[attr]).to eq ['is in invalid format']
    end
  end
end
