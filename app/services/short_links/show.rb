# frozen_string_literal: true

class ShortLinks::Show
  def call(url)
    ShortLink.find_by(url: url)
  end
end
