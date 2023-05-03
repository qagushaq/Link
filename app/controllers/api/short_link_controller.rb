# frozen_string_literal: true

class API::ShortLinkController < API::ApplicationController
  include DI[
    validate_input: 'services.validate_input',
    show_action: 'actions.short_links.show',
  ]

  def show
    authorize! User, to: :shortening_link?

    show_params = validate_input.(ShortLinks::ShowInput, request.POST)

    url = show_action.(show_params[:short_link][:url])

    respond_with url, serializer: ShortLinkSerializer
  end
end
