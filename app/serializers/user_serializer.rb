# frozen_string_literal: true

class UserSerializer < ApplicationSerializer
  set_type :user

  attributes :email
  attributes :email_confirmed, &:email_confirmed?
end
