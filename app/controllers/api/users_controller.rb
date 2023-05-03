# frozen_string_literal: true

class API::UsersController < API::ApplicationController
  include DI[
    create_user: 'actions.users.create',
    validate_input: 'services.validate_input',
    send_token: 'actions.confirm_email.send_token'
    ]
  # Creates user with email and password
  def create
    authorize! User, to: :create?

    create_params = validate_input.(Users::CreateInput, request.POST)
    user = create_user.(create_params[:user])

    send_token.(user)

    respond_with user, serializer: UserSerializer
  end
end
