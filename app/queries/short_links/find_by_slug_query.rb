# frozen_string_literal: true

class ShortLinks::FindBySlugQuery
  def call(slug)
    ShortLink.find_by!(slug: slug)
  rescue ActiveRecord::RecordNotFound
    raise ActiveRecord::RecordNotFound, I18n.t('errors.short_links.invalid_slug')
  end
end
