# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password

  MIN_PASSWORD_LENGTH = 6

  has_many :sessions, dependent: :destroy

  def email_confirmed?
    email_confirmed_at.present?
  end
end
