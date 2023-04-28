# frozen_string_literal: true

require 'sidekiq/web'

Rails.application.routes.draw do
  namespace :api, defaults: { format: 'json' } do
    mount ActionCable.server => '/cable'
    mount Sidekiq::Web => '/sidekiq'

    # Health check for ELB and in-container checks
    get '/health', to: ->(_env) { [200, {}, ['']] }

    if ENV.fetch('DOCS_ENABLED', '0') == '1'
      mount Rswag::Api::Engine => '/docs' # /api/docs/v1/swagger.yml
      mount Rswag::Ui::Engine => '/docs'  # /api/docs
    end
    
  end
end
