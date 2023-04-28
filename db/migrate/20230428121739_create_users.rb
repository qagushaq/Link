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

#execute 'ALTER TABLE users ADD created_at TIMESTAMP(6) WITHOUT TIME ZONE NOT NULL DEFAULT NOW()'
#execute 'ALTER TABLE users ADD updated_at TIMESTAMP(6) WITHOUT TIME ZONE NOT NULL DEFAULT NOW()'
#execute 'ALTER TABLE users ALTER COLUMN id SET DEFAULT gen_random_uuid()'



