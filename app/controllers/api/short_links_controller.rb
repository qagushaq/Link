# frozen_string_literal: true

class API::ShortLinksController < API::ApplicationController
  include DI[
    validate_input: 'services.validate_input',
    create_action: 'actions.short_links.create',
    find_short_link: 'queries.short_links.find_by_slug',
  ]

  def create
    authorize! User, to: :shortening_link?

    create_params = validate_input.(ShortLinks::CreateInput, request.POST)
    url = create_action.(create_params[:short_link][:url])

    respond_with url, serializer: ShortLinkSerializer
  end

  def show
    authorize! User, to: :shortening_link?

    url = find_short_link.(params[:id])

    respond_with url, serializer: ShortLinkSerializer
  end
end
