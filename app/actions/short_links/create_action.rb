# frozen_string_literal: true

class ShortLinks::CreateAction
  include DI[
    create_short_link: 'services.short_links.create',
  ]

  delegate :call, to: :create_short_link
end
