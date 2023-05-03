# frozen_string_literal: true

class ShortLinks::CreateInput < ApplicationContract
  json do
    required(:short_link).hash do
      required(:url).value(Types::Url)
    end
  end
end
