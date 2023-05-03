# frozen_string_literal: true

class EnableExtensions < ActiveRecord::Migration[7.0]
  def change
    enable_extension 'pgcrypto'
  end
end
