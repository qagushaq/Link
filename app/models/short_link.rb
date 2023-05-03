# frozen_string_literal: true

class ShortLink < ApplicationRecord
  validates :url, :slug, presence: true
end
