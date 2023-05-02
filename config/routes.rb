# frozen_string_literal: true

require 'sidekiq/web'

Rails.application.routes.draw do
  namespace :api, defaults: { format: 'json' } do
    mount Sidekiq::Web => '/sidekiq'

    if ENV.fetch('DOCS_ENABLED', '0') == '1'
      mount Rswag::Api::Engine => '/docs' # /api/docs/v1/swagger.yml
      mount Rswag::Ui::Engine => '/docs'  # /api/docs
    end

    resources :confirm_email, only: %i[create]

    resource :session, only: %i[create destroy]

    resources :users, only: %i[create]
    resource :user, only: %i[show]
  end
end
