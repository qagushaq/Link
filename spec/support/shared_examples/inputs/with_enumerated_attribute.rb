# frozen_string_literal: true

RSpec.shared_examples_for 'with enumerated attribute' do |parent, attr, values|
  parent = Array(parent)

  it "validates #{parent.join('.')}.#{attr} is enumerated" do
    params = parent.reverse.inject(attr => SecureRandom.uuid) { |o, i| { i => o } }
    res = described_class.new.(params)

    errors = res.errors.to_h.dig(*parent)
    expect(errors[attr] || []).to include "must be one of: #{values.join(', ')}"
  end
end
