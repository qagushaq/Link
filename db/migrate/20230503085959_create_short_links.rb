# frozen_string_literal: true

class CreateShortLinks < ActiveRecord::Migration[7.0]
  def change
    create_table :short_links, id: :uuid do |t|
      t.string :url, index: { unique: true }, null: false
      t.string :slug, limit: 6, index: { unique: true }, null: false

      t.timestamps
    end
  end
end
