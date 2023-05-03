# frozen_string_literal: true

class ShortLinks::ShowAction
  include DI[
    show_short_link: 'services.short_links.show'
  ]

  delegate :call, to: :show_short_link
end
