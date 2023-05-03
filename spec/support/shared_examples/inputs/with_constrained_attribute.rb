# frozen_string_literal: true

RSpec.shared_examples_for 'with constrained attribute' do |parent, attr, good_value, bad_value|
  it "validates #{parent}.#{attr} invalid value format" do
    res = described_class.new.(parent => { attr => bad_value })
    expect(res.errors[parent][attr] || []).to include 'is in invalid format'
  end

  it "validates #{parent}.#{attr} valid value format" do
    res = described_class.new.(parent => { attr => good_value })
    expect(res.errors[parent][attr] || []).not_to include 'is in invalid format'
  end
end
