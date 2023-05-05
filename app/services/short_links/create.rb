# frozen_string_literal: true

class ShortLinks::Create
  def call(url)
    link = ShortLink.find_by(url: url)
    return link if link

    ShortLink.create!(
      url: url,
      slug: SecureRandom.alphanumeric(6)
    )
  rescue ActiveRecord::RecordNotUnique
    retry
  end
end
