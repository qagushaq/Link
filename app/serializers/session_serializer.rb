# frozen_string_literal: true

class SessionSerializer < ApplicationSerializer
  set_type :session
  set_id :id

  belongs_to :user
  attributes :token
end
