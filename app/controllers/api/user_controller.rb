# frozen_string_literal: true

class API::UserController < API::ApplicationController
  # The profile of currently logged in user
  def show
    authorize! User, to: :show?

    respond_with current_user, serializer: UserSerializer
  end
end
