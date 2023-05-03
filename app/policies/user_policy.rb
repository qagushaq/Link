# frozen_string_literal: true

class UserPolicy < ApplicationPolicy
  def show?
    logged_in?
  end

  def create?
    true
  end

  def confirm_email?
    true
  end

  def shortening_link?
    logged_in?
    deny!(:email_not_confirmed) unless user.email_confirmed?
    true
  end

  def update?
    logged_in?
  end
end
