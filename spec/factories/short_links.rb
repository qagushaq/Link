# frozen_string_literal: true

FactoryBot.define do
  factory :short_link do
    url { 'https://www.google.com' }
    slug { 'ugXWan' }
  end
end
