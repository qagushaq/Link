# frozen_string_literal: true

class API::ShortLinksController < API::ApplicationController
  include DI[
    validate_input: 'services.validate_input',
    create_action: 'actions.short_links.create'
  ]

  def create
    authorize! User, to: :shortening_link?

    create_params = validate_input.(ShortLinks::CreateInput, request.POST)
    url = create_action.(create_params[:short_link][:url])

    respond_with url, serializer: ShortLinkSerializer
  end
end
