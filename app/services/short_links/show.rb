# frozen_string_literal: true

class ShortLinks::Show
  def call(slug)
    ShortLink.find_by!(slug: slug)
  rescue ActiveRecord::RecordNotFound
    raise ActiveRecord::RecordNotFound, 'Short Link not found'
  end
end
