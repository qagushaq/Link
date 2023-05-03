# frozen_string_literal: true

class Users::SendEmailConfirmationRequestWorker
  include DryWorker

  def perform(user_id)
    user = User.find_by(id: user_id)
    return unless user

    logger = Logger.new(Rails.root.join('log/user_email_confirmation_token.log'))
    logger.info("Token: #{user.email_confirmation_token}")
  rescue ActiveRecord::RecordNotFound
    Rails.logger.warn("User with id=#{user_id} was not found")
  end
end
