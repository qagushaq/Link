# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    password { 'future' }

    sequence(:email) { |i| "user-#{i}@example.com" }
    email_confirmed_at { Time.current }

    trait :with_unconfirmed_email do
      email_confirmed_at { nil }
      email_confirmation_token { 'token' }
    end
  end
end
