# frozen_string_literal: true

class API::ConfirmEmailController < API::ApplicationController
  include DI[
    validate_input: 'services.validate_input',
    confirm_by_token: 'actions.confirm_email.confirm_by_token'
  ]

  def create
    create_params = validate_input.(ConfirmEmails::CreateInput, request.POST)

    confirm_by_token.(create_params[:token])

    head :no_content
  end
end
