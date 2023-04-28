# frozen_string_literal: true

class Users::Create
  def call(create_params)
    User.create!(create_params)
  end
end
