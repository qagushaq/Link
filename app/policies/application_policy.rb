# frozen_string_literal: true

# Base class for application policies
class ApplicationPolicy < ActionPolicy::Base
  authorize :user, optional: true

  def logged_in?
    deny!(:not_logged_in) unless user
    true
  end

  def not_logged_in?
    deny!(:logged_in) if user
    true
  end
end
