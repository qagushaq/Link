# frozen_string_literal: true

class SessionPolicy < ApplicationPolicy
  def create?
    not_logged_in?
  end

  def destroy?
    logged_in?
  end
end
