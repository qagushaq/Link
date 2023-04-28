# frozen_string_literal: true

class Users::CreateAction
  include DI[
    'services.users.create',
    'services.users.create_email_confirmation_token',
    'workers.users.send_email_confirmation_request'
  ]

  def call(user_params)
    create_user(user_params).tap do |user|
      send_email_confirmation_request.(user.id)
    end
  rescue ActiveRecord::RecordNotUnique
    raise RequestError.new(I18n.t('errors.users.email_taken'), field: 'user/email')
  end

  private

  def create_user(user_params)
    User.transaction do
      create.(user_params).tap do |user|
        create_email_confirmation_token.(user)
      end
    end
  end
end
