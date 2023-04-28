# frozen_string_literal: true

class Users::UpdateAction
  def call(user, update_params)
    user.update!(update_params)
  end
end
