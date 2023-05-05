# frozen_string_literal: true

class ShortLinkSerializer < ApplicationSerializer
  set_type :short_link
  set_id :id

  attributes :url, :slug
end
