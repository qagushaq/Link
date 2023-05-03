# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users, id: :uuid do |t|
      t.string :password_digest, null: false
      t.string :email, null: false
      t.timestamp :email_confirmed_at
      t.text :email_confirmation_token, index: { unique: true }
      t.timestamps
    end
    add_index :users, 'lower(email)', unique: true
  end
end
