# frozen_string_literal: true

class CreateSessions < ActiveRecord::Migration[7.0]
  def change
    create_table :sessions, id: :uuid do |t|
      t.uuid :user_id, null: false

      t.timestamps
    end
    add_index :sessions, :user_id
  end
end
