# frozen_string_literal: true

class APIResponder < ActionController::Responder
  protected

  # This is the common behavior for formats associated with APIs, such as :xml and :json.
  def api_behavior
    if get?
      display resource
    elsif post?
      # Native Rails approach is to
      #   display resource, status: :created, location: api_location
      display resource, status: :created
    else
      head :no_content
    end
  end
end
