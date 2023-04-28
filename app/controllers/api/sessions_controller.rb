# frozen_string_literal: true

class API::SessionsController < API::ApplicationController
  include DI[
    'actions.auth.sign_in',
    'actions.auth.sign_out',
    'services.validate_input'
  ]

  # Sign in with email + password
  def create
    authorize! Session, to: :create?

    session_params = validate_input.(Sessions::CreateInput, request.POST)
    session = sign_in.(**session_params[:session])

    respond_with_session(session)
  end

  # The profile of currently logged in user
  def show
    authorize! User, to: :show?

    respond_with current_user, serializer: UserSerializer
  end

  # Sign out
  def destroy
    authorize! Session, to: :destroy?

    session = sign_out.(current_session)

    reset_auth_headers
    respond_with session, serializer: SessionSerializer
  end

  private

  def respond_with_session(session)
    store_auth_headers(session)
    respond_with session,
      include: %i[user],
      serializer: SessionSerializer
  end
end
