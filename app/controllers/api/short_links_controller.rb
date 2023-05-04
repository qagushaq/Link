# frozen_string_literal: true

class API::ShortLinksController < API::ApplicationController
  include DI[
    validate_input: 'services.validate_input',
    create_action: 'actions.short_links.create',
    show_short_link: 'services.short_links.show'
  ]

  def create
    authorize! User, to: :shortening_link?

    create_params = validate_input.(ShortLinks::CreateInput, request.POST)
    url = create_action.(create_params[:short_link][:url])

    respond_with url, serializer: ShortLinkSerializer
  end

  def show
    authorize! User, to: :shortening_link?

    url = show_short_link.(params[:id])

    respond_with url, serializer: ShortLinkSerializer
  end
end
