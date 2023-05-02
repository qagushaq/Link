# frozen_string_literal: true

RSpec.shared_examples_for 'with boolean attributes' do |parent, attrs = []|
  attrs.each do |attr|
    it "validates #{parent}.#{attr} is a boolean" do
      params = {}
      params[attr] = 123
      params = { parent => params } if parent
      res = described_class.new.(params)

      errors = res.errors
      errors = errors[parent] if parent
      expect(errors[attr]).to eq ['must be boolean']
    end
  end
end
