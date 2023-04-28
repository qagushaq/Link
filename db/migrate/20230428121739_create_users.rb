class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users, id: :uuid do |t|
      t.string :password_digest
      t.string :email, null: false
      t.timestamp :email_confirmed_at
      t.text :email_confirmation_token, limit: 30
      t.timestamps
    end
    add_index :users, 'lower(email)', unique: true
  end
end
