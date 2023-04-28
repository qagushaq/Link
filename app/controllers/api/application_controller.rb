# frozen_string_literal: true

class API::ApplicationController < ::ApplicationController
  include ActionPolicy::Behaviour
  include TokenAuth
  include RenderersHelper
  include ErrorHandling

  authorize :user, through: :current_user
  authorize :session, through: :current_session

  respond_to :json

  self.responder = APIResponder
end
